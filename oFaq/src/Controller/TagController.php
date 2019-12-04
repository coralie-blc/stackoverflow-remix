<?php

namespace App\Controller;

use App\Entity\Tag;
use App\Form\TagType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

/**
 * @Route("/tag")
 */
class TagController extends AbstractController
{

    /**
     * @Route("/", name="tag_list")
     */
    public function allTags()
    {
        $tags = $this->getDoctrine()->getRepository(Tag::class)->findAllTags();

        // return $this->render('partials/navtag.html.twig', array('tags' => $tags));
        return $this->render('tag/index.html.twig', [
            'tags' => $tags,
        ]);
    }


    /**
     * @Route("/new", name="add_tag")
     * @IsGranted("ROLE_ADMIN")
     */
    public function index(Request $request)
    {
        $tag = new Tag;
        $tagForm = $this->createForm(TagType::class, $tag);
        $tagForm->handleRequest($request);

        if ($tagForm->isSubmitted() && $tagForm->isValid()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($tag);
            $entityManager->flush();

            $this->addFlash('success', 'L\'ajout du Tag s\'est déroulé avec succès.');
            return $this->redirectToRoute('tag_list');
        }
        return $this->render('tag/add_tag.html.twig', [
            'tagForm' => $tagForm->createView(),
        ]);
    }


    /**
     * @Route("/{id}/edit", name="tag_edit", methods={"GET","POST"})
     */
    public function edit(Request $request, Tag $tag)
    {
        $form = $this->createForm(TagType::class, $tag);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $this->getDoctrine()->getManager()->flush();

            $this->addFlash('success', 'Modification prise en compte.');
            return $this->redirectToRoute('tag_list');
        }

        return $this->render('tag/edit_tag.html.twig', [
            'tag' => $tag,
            'tagForm' => $form->createView(),
        ]);
    }


    /**
     * @Route("/{tag}/delete", name="tag_delete")
     */
    public function delete(Request $request, Tag $tag)
    {
        $entityManager = $this->getDoctrine()->getManager();
        $tag = $entityManager->getRepository(Tag::class)->find($tag);

        $entityManager->remove($tag);
        $entityManager->flush();

        $this->addFlash('danger', 'Vous avez bien supprimé le tag.');
        return $this->redirectToRoute('tag_list');
    } 
    



    /**
     * @Route("/{tag}/questions", name="tag_questions", methods={"GET","POST"})
     */
    public function questionByTag(Tag $tag)
    {
        // $tags = $this->getDoctrine()->getRepository(Tag::class)->findAllTags();

        return $this->render('tag/questions_by_tag.html.twig', [
            'tag' => $tag,
        ]);
    }
    
    
}
