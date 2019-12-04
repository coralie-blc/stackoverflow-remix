<?php

namespace App\Controller;

use App\Form\editProfil;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;


/**
 * @Route("/user")
 */
class UserController extends AbstractController
{

    /**
     * @Route("/space", name="user_space")
     */
    public function user()
    {
        $currentUser = $this->getUser();
        $currentUser->getId();
        
        return $this->render('user/user_space.html.twig', [
            'user' => $currentUser
        ] );
    }


    /**
     * @Route("/profil/edit", name="edit_profil")
     */
    public function editProfil(Request $request, UserPasswordEncoderInterface $encoder)
    {
        $currentUser = $this->getUser();
        $currentUser->getId();

        $form = $this->createForm(editProfil::class, $currentUser);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $form->getData();
            $user->setRoles(['ROLE_USER']);

            $plainPassword = $user->getPassword();
            $encodedPassword = $encoder->encodePassword($user, $plainPassword);
            $user->setPassword($encodedPassword);

            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();

            $this->addFlash('success', 'Vous êtes bien inscrit.');
            return $this->redirectToRoute('user_space');
        }

        return $this->render('security/register.html.twig', [
            'registerForm' => $form->createView(),
            'mainNavRegistration' => true, 
            'title' => 'Inscription'
        ]);
    }   




}
