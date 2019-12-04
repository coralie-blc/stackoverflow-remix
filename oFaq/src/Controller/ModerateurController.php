<?php

namespace App\Controller;

use App\Entity\Answer;
use App\Entity\Question;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\Common\Persistence\ObjectManager;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;


/**
 * @Route("/moderateur")
 */
class ModerateurController extends AbstractController
{
    /**
     * @Route("/{question}/visible", name="question_visible")
     */
    public function visible(Request $request, Question $question, ObjectManager $em)
    {
        $token = $request->request->get('token');

        if ( $this->isCsrfTokenValid('show', $token)){

            $question->setVisible(1);
            $em->persist($question);
            $em->flush();

        return $this->redirectToRoute('home');
        }
    }

    /**
     * @Route("/{question}/hidden", name="question_hidden")
     */
    public function hidden(Request $request, Question $question, ObjectManager $em)
    {
        $token = $request->request->get('token');

        if ($this->isCsrfTokenValid('hide', $token)){            
            $question->setVisible(0);
            $em->persist($question);
            $em->flush();
 
        return $this->redirectToRoute('home');
        }
        

    }


////
////
// Partie réservée à la modération des réponses
////
////



    /**
     * @Route("/{question}/{answer}/visible", name="answer_visible")
     */
    public function questionVisible(Request $request, Question $question, Answer $answer, ObjectManager $em)
    {
        $token = $request->request->get('token');

        if ( $this->isCsrfTokenValid('show', $token)){

            $answer->setVisible(1);
            $em->persist($answer);
            $em->flush();

        return $this->redirectToRoute('single_question', ['question'=> $question->getId()]) ;
        }
    }


    /**
     * @Route("/{question}/{answer}/hidden", name="answer_hidden")
     */
    public function questionHidden(Request $request, Question $question, Answer $answer, ObjectManager $em)
    {
        $token = $request->request->get('token');

        if ($this->isCsrfTokenValid('hide', $token)){            
            $answer->setVisible(0);
            $em->persist($answer);
            $em->flush();
 
        return $this->redirectToRoute('single_question', ['question'=> $question->getId()]) ;
        }
    }

}
