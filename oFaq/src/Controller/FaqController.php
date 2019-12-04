<?php

namespace App\Controller;

use App\Entity\Tag;
use App\Entity\Answer;
use App\Entity\Question;
use App\Form\AnswerType;
use App\Form\QuestionType;
use App\Entity\QuestionLike;
use App\Repository\QuestionLikeRepository;
use Knp\Component\Pager\PaginatorInterface;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class FaqController extends AbstractController
{
    /**
     * @Route("/", name="home")
     */
    public function index(PaginatorInterface $paginator, Request $request) : Response
    {
        $questions = $this->getDoctrine()->getRepository(Question::class)->findQuestionIfVisible();
        $tags = $this->getDoctrine()->getRepository(Tag::class)->findAllTags();

        // Knp Paginator
        $questions = $paginator->paginate(
        $this->getDoctrine()->getRepository(Question::class)->findAllQuestionsPaginate(),
        $request->query->getInt('page', 1),
        9
        );

        // Repository method, visible filter.
        $hiddenquestions = $this->getDoctrine()->getRepository(Question::class)->findQuestionIfNotVisible();


        return $this->render('faq/index.html.twig', [
            'questions' => $questions,
            'hiddenQuestions' => $hiddenquestions,
            'tags' => $tags
        ]);
    }


    /**
     * @Route("/question/{question}/details", name="single_question")
     */
    public function single_question(Question $question)
    {
        $tags = $this->getDoctrine()->getRepository(Tag::class)->findAllTags();

        $answer = $this->getDoctrine()->getRepository(Answer::class)->findByQuestion($question);
        $answerForm = $this->createForm(AnswerType::class);

        return $this->render('faq/single_question.html.twig', [
            'question' => $question,
            'answer' => $answer,
            'answerForm' => $answerForm->createView(),
            'tags' => $tags
        ]);
    }


    /**
     * 
     * @Route("/question/add", name="add_question")
     */
    public function new(Request $request)
    {
        $question = new Question();
        $questionForm = $this->createForm(QuestionType::class, $question);
        $questionForm->handleRequest($request);

        if ($questionForm->isSubmitted() && $questionForm->isValid()) {
            $currentUser = $this->getUser();
            $question->setUser($currentUser);

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($question);
            $entityManager->flush();

            $this->addFlash('success', 'La question a bien été ajoutée.');
            return $this->redirectToRoute('home');
        }

        return $this->render('question/add_question.html.twig', [
            'questionForm' => $questionForm->createView(),
        ]);
    }


    /**
     * @Route("/{question}/answer/add", name="add_answer")
     */
    public function newAnswer(Request $request, Question $question)
    {
        $answer = new Answer();
        $answerForm = $this->createForm(AnswerType::class, $answer);
        $answerForm->handleRequest($request);

        if ($answerForm->isSubmitted() && $answerForm->isValid()) {
            $currentUser = $this->getUser();
            $answer->setUser($currentUser);
            
            $answer->setQuestion($question);

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($answer);
            $entityManager->flush();

            $this->addFlash('success', 'La réponse a bien été ajoutée.');
            return $this->redirectToRoute('single_question', ['question'=> $question->getId()]);
        }

        return $this->render('Answer/add_Answer.html.twig', [
            'AnswerForm' => $AnswerForm->createView(),
        ]);
    }


    /**
     * @Route("/question/{id}/edit", name="question_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Question $question)
    {
        $form = $this->createForm(QuestionType::class, $question);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            $this->addFlash('success', 'Modication prise en compte.');
            return $this->redirectToRoute('home');
        }

        return $this->render('question/edit_question.html.twig', [
            'question' => $question,
            'questionForm' => $form->createView(),
        ]);
    }


    /**
     * @Route("/question/{question}/delete", name="question_delete")
     */
    public function delete(Question $question)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $question = $entityManager->getRepository(Question::class)->find($question);

        $entityManager->remove($question);
        $entityManager->flush();

        $this->addFlash('danger', 'Suppression réalisée.');
        return $this->redirectToRoute('home');
    } 


    /**
     * Like or Unlike Question
     * 
     * @Route("/question/{question}/like", name="question_like")
     */
    public function like(Question $question, ObjectManager $em, QuestionLikeRepository $likeRepo): Response 
    {
        $user = $this->getUser();

        if(!$user) return $this->json([
            'code' => 403,
            'message' => "Il faut être connecté!"
        ], 403);


        if($question->isLikedByUser($user)) {
            $like = $likeRepo->findOneBy([
                'question' => $question,
                'user' => $user,
            ]);

            $em->remove($like);
            $em->flush();

            return $this->json([
                'code' => 200,
                'message' => "Like pris en compte!",
                'likes' => $likeRepo->count(['question' => $question])   
            ], 200);

        }

        $like = new QuestionLike();
        $like->setQuestion($question)
            ->setUser($user);

        $em->persist($like);
        $em->flush();

        return $this->json([
            'code' => 200, 
            'message' => 'Like bien ajouté',
            'likes' => $likeRepo->count(['question' => $question])   
        ], 200);
    }


    /**
     * @Route("/{question}/{answer}/approve", name="answer_approve")
     */
    public function approve(Request $request, Answer $answer, Question $question, ObjectManager $em)
    {
        $token = $request->request->get('token');

        if ($this->isCsrfTokenValid('approve', $token)){            
            $answer->setApprove(1);
            $em->persist($answer);
            $em->flush();
 
        $this->addFlash('success', 'La réponse a bien été approuvée.');
        return $this->redirectToRoute('single_question', ['question'=> $question->getId()]) ;
        }
    }
}
