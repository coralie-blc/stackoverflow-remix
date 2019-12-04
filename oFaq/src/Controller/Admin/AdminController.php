<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Form\AdminType;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class AdminController extends AbstractController
{
    /**
     * @Route("/admin/users", name="admin_users")
     */
    public function index()
    {
        $users = $this->getDoctrine()->getRepository(User::class)->findAllByRole();
       

        return $this->render('admin/admin/index.html.twig', [
            'users' => $users,
        ]);
    }


    /**
     * @Route("/admin/users/{user}", name="admin_user_edit")
     */
    public function userRole(Request $request, User $user)
    {
        $users = $this->getDoctrine()->getRepository(User::class)->findAllByRole();
        $form = $this->createForm(AdminType::class, $user);
        $form->handleRequest($request);
        // dump($form);exit;

        if ($form->isSubmitted() && $form->isValid()) {
            $user = $form->getData();
            // $user->setRoles(['ROLE_USER']);
                
            $em = $this->getDoctrine()->getManager();
            $em->persist($user);
            $em->flush();
        
            $this->addFlash('success', 'Le rôle a bien été modifié.');
            return $this->redirectToRoute('admin_users');
        }

        return $this->render('admin/admin/edit_roles.html.twig', [
            'users' => $users,
            'UserType' => $form->createView(),
        ]);
    }
    
}


