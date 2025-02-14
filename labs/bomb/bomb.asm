00000000004013bc <blank_line>:
  4013bc:	55                   	push   %rbp
  4013bd:	53                   	push   %rbx
  4013be:	48 83 ec 08          	sub    $0x8,%rsp
  4013c2:	48 89 fb             	mov    %rdi,%rbx
  4013c5:	eb 17                	jmp    4013de <blank_line+0x22>
  4013c7:	e8 94 f8 ff ff       	callq  400c60 <__ctype_b_loc@plt>
  4013cc:	48 83 c3 01          	add    $0x1,%rbx
  4013d0:	48 0f be ed          	movsbq %bpl,%rbp
  4013d4:	48 8b 00             	mov    (%rax),%rax
  4013d7:	f6 44 68 01 20       	testb  $0x20,0x1(%rax,%rbp,2)
  4013dc:	74 0f                	je     4013ed <blank_line+0x31>
  4013de:	0f b6 2b             	movzbl (%rbx),%ebp
  4013e1:	40 84 ed             	test   %bpl,%bpl
  4013e4:	75 e1                	jne    4013c7 <blank_line+0xb>
  4013e6:	b8 01 00 00 00       	mov    $0x1,%eax
  4013eb:	eb 05                	jmp    4013f2 <blank_line+0x36>
  4013ed:	b8 00 00 00 00       	mov    $0x0,%eax
  4013f2:	48 83 c4 08          	add    $0x8,%rsp
  4013f6:	5b                   	pop    %rbx
  4013f7:	5d                   	pop    %rbp
  4013f8:	c3                   	retq

00000000004013f9 <skip>:
  4013f9:	53                   	push   %rbx
  4013fa:	48 63 05 5f 23 20 00 	movslq 0x20235f(%rip),%rax        # 603760 <num_input_strings>
  401401:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  401405:	48 c1 e7 04          	shl    $0x4,%rdi
  401409:	48 81 c7 80 37 60 00 	add    $0x603780,%rdi
  401410:	48 8b 15 51 23 20 00 	mov    0x202351(%rip),%rdx        # 603768 <infile>
  401417:	be 50 00 00 00       	mov    $0x50,%esi
  40141c:	e8 5f f7 ff ff       	callq  400b80 <fgets@plt>
  401421:	48 89 c3             	mov    %rax,%rbx
  401424:	48 85 c0             	test   %rax,%rax
  401427:	74 0c                	je     401435 <skip+0x3c>
  401429:	48 89 c7             	mov    %rax,%rdi
  40142c:	e8 8b ff ff ff       	callq  4013bc <blank_line>
  401431:	85 c0                	test   %eax,%eax
  401433:	75 c5                	jne    4013fa <skip+0x1>
  401435:	48 89 d8             	mov    %rbx,%rax
  401438:	5b                   	pop    %rbx
  401439:	c3                   	retq

000000000040143a <explode_bomb>:
  40143a:	48 83 ec 08          	sub    $0x8,%rsp
  40143e:	bf a3 25 40 00       	mov    $0x4025a3,%edi
  401443:	e8 c8 f6 ff ff       	callq  400b10 <puts@plt>
  401448:	bf ac 25 40 00       	mov    $0x4025ac,%edi
  40144d:	e8 be f6 ff ff       	callq  400b10 <puts@plt>
  401452:	bf 08 00 00 00       	mov    $0x8,%edi
  401457:	e8 c4 f7 ff ff       	callq  400c20 <exit@plt>

000000000040145c <read_six_numbers>:
  40145c:	48 83 ec 18          	sub    $0x18,%rsp
  401460:	48 89 f2             	mov    %rsi,%rdx
  401463:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  401467:	48 8d 46 14          	lea    0x14(%rsi),%rax
  40146b:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401470:	48 8d 46 10          	lea    0x10(%rsi),%rax
  401474:	48 89 04 24          	mov    %rax,(%rsp)
  401478:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  40147c:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401480:	be c3 25 40 00       	mov    $0x4025c3,%esi
  401485:	b8 00 00 00 00       	mov    $0x0,%eax
  40148a:	e8 61 f7 ff ff       	callq  400bf0 <__isoc99_sscanf@plt>
  40148f:	83 f8 05             	cmp    $0x5,%eax
  401492:	7f 05                	jg     401499 <read_six_numbers+0x3d>
  401494:	e8 a1 ff ff ff       	callq  40143a <explode_bomb>
  401499:	48 83 c4 18          	add    $0x18,%rsp
  40149d:	c3                   	retq

000000000040149e <read_line>:
  40149e:	48 83 ec 08          	sub    $0x8,%rsp
  4014a2:	b8 00 00 00 00       	mov    $0x0,%eax
  4014a7:	e8 4d ff ff ff       	callq  4013f9 <skip>
  4014ac:	48 85 c0             	test   %rax,%rax
  4014af:	75 6e                	jne    40151f <read_line+0x81>
  4014b1:	48 8b 05 90 22 20 00 	mov    0x202290(%rip),%rax        # 603748 <stdin@@GLIBC_2.2.5>
  4014b8:	48 39 05 a9 22 20 00 	cmp    %rax,0x2022a9(%rip)        # 603768 <infile>
  4014bf:	75 14                	jne    4014d5 <read_line+0x37>
  4014c1:	bf d5 25 40 00       	mov    $0x4025d5,%edi
  4014c6:	e8 45 f6 ff ff       	callq  400b10 <puts@plt>
  4014cb:	bf 08 00 00 00       	mov    $0x8,%edi
  4014d0:	e8 4b f7 ff ff       	callq  400c20 <exit@plt>
  4014d5:	bf f3 25 40 00       	mov    $0x4025f3,%edi
  4014da:	e8 01 f6 ff ff       	callq  400ae0 <getenv@plt>
  4014df:	48 85 c0             	test   %rax,%rax
  4014e2:	74 0a                	je     4014ee <read_line+0x50>
  4014e4:	bf 00 00 00 00       	mov    $0x0,%edi
  4014e9:	e8 32 f7 ff ff       	callq  400c20 <exit@plt>
  4014ee:	48 8b 05 53 22 20 00 	mov    0x202253(%rip),%rax        # 603748 <stdin@@GLIBC_2.2.5>
  4014f5:	48 89 05 6c 22 20 00 	mov    %rax,0x20226c(%rip)        # 603768 <infile>
  4014fc:	b8 00 00 00 00       	mov    $0x0,%eax
  401501:	e8 f3 fe ff ff       	callq  4013f9 <skip>
  401506:	48 85 c0             	test   %rax,%rax
  401509:	75 14                	jne    40151f <read_line+0x81>
  40150b:	bf d5 25 40 00       	mov    $0x4025d5,%edi
  401510:	e8 fb f5 ff ff       	callq  400b10 <puts@plt>
  401515:	bf 00 00 00 00       	mov    $0x0,%edi
  40151a:	e8 01 f7 ff ff       	callq  400c20 <exit@plt>
  40151f:	8b 15 3b 22 20 00    	mov    0x20223b(%rip),%edx        # 603760 <num_input_strings>
  401525:	48 63 c2             	movslq %edx,%rax
  401528:	48 8d 34 80          	lea    (%rax,%rax,4),%rsi
  40152c:	48 c1 e6 04          	shl    $0x4,%rsi
  401530:	48 81 c6 80 37 60 00 	add    $0x603780,%rsi
  401537:	48 89 f7             	mov    %rsi,%rdi
  40153a:	b8 00 00 00 00       	mov    $0x0,%eax
  40153f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401546:	f2 ae                	repnz scas %es:(%rdi),%al
  401548:	48 f7 d1             	not    %rcx
  40154b:	48 83 e9 01          	sub    $0x1,%rcx
  40154f:	83 f9 4e             	cmp    $0x4e,%ecx
  401552:	7e 46                	jle    40159a <read_line+0xfc>
  401554:	bf fe 25 40 00       	mov    $0x4025fe,%edi
  401559:	e8 b2 f5 ff ff       	callq  400b10 <puts@plt>
  40155e:	8b 05 fc 21 20 00    	mov    0x2021fc(%rip),%eax        # 603760 <num_input_strings>
  401564:	8d 50 01             	lea    0x1(%rax),%edx
  401567:	89 15 f3 21 20 00    	mov    %edx,0x2021f3(%rip)        # 603760 <num_input_strings>
  40156d:	48 98                	cltq
  40156f:	48 6b c0 50          	imul   $0x50,%rax,%rax
  401573:	48 bf 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rdi
  40157a:	75 6e 63
  40157d:	48 89 b8 80 37 60 00 	mov    %rdi,0x603780(%rax)
  401584:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
  40158b:	2a 2a 00
  40158e:	48 89 b8 88 37 60 00 	mov    %rdi,0x603788(%rax)
  401595:	e8 a0 fe ff ff       	callq  40143a <explode_bomb>
  40159a:	83 e9 01             	sub    $0x1,%ecx
  40159d:	48 63 c9             	movslq %ecx,%rcx
  4015a0:	48 63 c2             	movslq %edx,%rax
  4015a3:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  4015a7:	48 c1 e0 04          	shl    $0x4,%rax
  4015ab:	c6 84 01 80 37 60 00 	movb   $0x0,0x603780(%rcx,%rax,1)
  4015b2:	00
  4015b3:	83 c2 01             	add    $0x1,%edx
  4015b6:	89 15 a4 21 20 00    	mov    %edx,0x2021a4(%rip)        # 603760 <num_input_strings>
  4015bc:	48 89 f0             	mov    %rsi,%rax
  4015bf:	48 83 c4 08          	add    $0x8,%rsp
  4015c3:	c3                   	retq

00000000004015c4 <phase_defused>:
  4015c4:	48 83 ec 78          	sub    $0x78,%rsp
  4015c8:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4015cf:	00 00
  4015d1:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  4015d6:	31 c0                	xor    %eax,%eax
  4015d8:	83 3d 81 21 20 00 06 	cmpl   $0x6,0x202181(%rip)        # 603760 <num_input_strings>
  4015df:	75 5e                	jne    40163f <phase_defused+0x7b>
  4015e1:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  4015e6:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  4015eb:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  4015f0:	be 19 26 40 00       	mov    $0x402619,%esi
  4015f5:	bf 70 38 60 00       	mov    $0x603870,%edi
  4015fa:	e8 f1 f5 ff ff       	callq  400bf0 <__isoc99_sscanf@plt>
  4015ff:	83 f8 03             	cmp    $0x3,%eax
  401602:	75 31                	jne    401635 <phase_defused+0x71>
  401604:	be 22 26 40 00       	mov    $0x402622,%esi
  401609:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  40160e:	e8 25 fd ff ff       	callq  401338 <strings_not_equal>
  401613:	85 c0                	test   %eax,%eax
  401615:	75 1e                	jne    401635 <phase_defused+0x71>
  401617:	bf f8 24 40 00       	mov    $0x4024f8,%edi
  40161c:	e8 ef f4 ff ff       	callq  400b10 <puts@plt>
  401621:	bf 20 25 40 00       	mov    $0x402520,%edi
  401626:	e8 e5 f4 ff ff       	callq  400b10 <puts@plt>
  40162b:	b8 00 00 00 00       	mov    $0x0,%eax
  401630:	e8 0d fc ff ff       	callq  401242 <secret_phase>
  401635:	bf 58 25 40 00       	mov    $0x402558,%edi
  40163a:	e8 d1 f4 ff ff       	callq  400b10 <puts@plt>
  40163f:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  401644:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40164b:	00 00
  40164d:	74 05                	je     401654 <phase_defused+0x90>
  40164f:	e8 dc f4 ff ff       	callq  400b30 <__stack_chk_fail@plt>
  401654:	48 83 c4 78          	add    $0x78,%rsp
  401658:	c3                   	retq
  401659:	90                   	nop
  40165a:	90                   	nop
  40165b:	90                   	nop
  40165c:	90                   	nop
  40165d:	90                   	nop
  40165e:	90                   	nop
  40165f:	90                   	nop

0000000000401660 <sigalrm_handler>:
  401660:	48 83 ec 08          	sub    $0x8,%rsp
  401664:	b9 00 00 00 00       	mov    $0x0,%ecx
  401669:	ba 78 26 40 00       	mov    $0x402678,%edx
  40166e:	be 01 00 00 00       	mov    $0x1,%esi
  401673:	48 8b 3d d6 20 20 00 	mov    0x2020d6(%rip),%rdi        # 603750 <stderr@@GLIBC_2.2.5>
  40167a:	b8 00 00 00 00       	mov    $0x0,%eax
  40167f:	e8 bc f5 ff ff       	callq  400c40 <__fprintf_chk@plt>
  401684:	bf 01 00 00 00       	mov    $0x1,%edi
  401689:	e8 92 f5 ff ff       	callq  400c20 <exit@plt>

000000000040168e <rio_readlineb>:
  40168e:	41 57                	push   %r15
  401690:	41 56                	push   %r14
  401692:	41 55                	push   %r13
  401694:	41 54                	push   %r12
  401696:	55                   	push   %rbp
  401697:	53                   	push   %rbx
  401698:	48 83 ec 38          	sub    $0x38,%rsp
  40169c:	49 89 f6             	mov    %rsi,%r14
  40169f:	48 89 54 24 18       	mov    %rdx,0x18(%rsp)
  4016a4:	48 83 fa 01          	cmp    $0x1,%rdx
  4016a8:	0f 86 c9 00 00 00    	jbe    401777 <rio_readlineb+0xe9>
  4016ae:	48 89 fb             	mov    %rdi,%rbx
  4016b1:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  4016b7:	4c 8d 67 10          	lea    0x10(%rdi),%r12
  4016bb:	eb 30                	jmp    4016ed <rio_readlineb+0x5f>
  4016bd:	ba 00 20 00 00       	mov    $0x2000,%edx
  4016c2:	4c 89 e6             	mov    %r12,%rsi
  4016c5:	8b 3b                	mov    (%rbx),%edi
  4016c7:	e8 94 f4 ff ff       	callq  400b60 <read@plt>
  4016cc:	89 43 04             	mov    %eax,0x4(%rbx)
  4016cf:	85 c0                	test   %eax,%eax
  4016d1:	79 12                	jns    4016e5 <rio_readlineb+0x57>
  4016d3:	e8 18 f4 ff ff       	callq  400af0 <__errno_location@plt>
  4016d8:	83 38 04             	cmpl   $0x4,(%rax)
  4016db:	74 10                	je     4016ed <rio_readlineb+0x5f>
  4016dd:	0f 1f 00             	nopl   (%rax)
  4016e0:	e9 a1 00 00 00       	jmpq   401786 <rio_readlineb+0xf8>
  4016e5:	85 c0                	test   %eax,%eax
  4016e7:	74 71                	je     40175a <rio_readlineb+0xcc>
  4016e9:	4c 89 63 08          	mov    %r12,0x8(%rbx)
  4016ed:	8b 6b 04             	mov    0x4(%rbx),%ebp
  4016f0:	85 ed                	test   %ebp,%ebp
  4016f2:	7e c9                	jle    4016bd <rio_readlineb+0x2f>
  4016f4:	85 ed                	test   %ebp,%ebp
  4016f6:	41 0f 95 c7          	setne  %r15b
  4016fa:	41 0f b6 c7          	movzbl %r15b,%eax
  4016fe:	89 44 24 0c          	mov    %eax,0xc(%rsp)
  401702:	45 0f b6 ff          	movzbl %r15b,%r15d
  401706:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  40170a:	48 89 ce             	mov    %rcx,%rsi
  40170d:	b9 01 00 00 00       	mov    $0x1,%ecx
  401712:	4c 89 fa             	mov    %r15,%rdx
  401715:	48 89 74 24 10       	mov    %rsi,0x10(%rsp)
  40171a:	48 8d 7c 24 2f       	lea    0x2f(%rsp),%rdi
  40171f:	e8 9c f4 ff ff       	callq  400bc0 <__memcpy_chk@plt>
  401724:	4c 03 7c 24 10       	add    0x10(%rsp),%r15
  401729:	4c 89 7b 08          	mov    %r15,0x8(%rbx)
  40172d:	8b 44 24 0c          	mov    0xc(%rsp),%eax
  401731:	29 c5                	sub    %eax,%ebp
  401733:	89 6b 04             	mov    %ebp,0x4(%rbx)
  401736:	83 f8 01             	cmp    $0x1,%eax
  401739:	75 13                	jne    40174e <rio_readlineb+0xc0>
  40173b:	49 83 c6 01          	add    $0x1,%r14
  40173f:	0f b6 44 24 2f       	movzbl 0x2f(%rsp),%eax
  401744:	41 88 46 ff          	mov    %al,-0x1(%r14)
  401748:	3c 0a                	cmp    $0xa,%al
  40174a:	75 18                	jne    401764 <rio_readlineb+0xd6>
  40174c:	eb 2f                	jmp    40177d <rio_readlineb+0xef>
  40174e:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%rsp)
  401753:	75 3a                	jne    40178f <rio_readlineb+0x101>
  401755:	44 89 e8             	mov    %r13d,%eax
  401758:	eb 03                	jmp    40175d <rio_readlineb+0xcf>
  40175a:	44 89 e8             	mov    %r13d,%eax
  40175d:	83 f8 01             	cmp    $0x1,%eax
  401760:	75 1b                	jne    40177d <rio_readlineb+0xef>
  401762:	eb 34                	jmp    401798 <rio_readlineb+0x10a>
  401764:	41 83 c5 01          	add    $0x1,%r13d
  401768:	49 63 c5             	movslq %r13d,%rax
  40176b:	48 3b 44 24 18       	cmp    0x18(%rsp),%rax
  401770:	73 0b                	jae    40177d <rio_readlineb+0xef>
  401772:	e9 76 ff ff ff       	jmpq   4016ed <rio_readlineb+0x5f>
  401777:	41 bd 01 00 00 00    	mov    $0x1,%r13d
  40177d:	41 c6 06 00          	movb   $0x0,(%r14)
  401781:	49 63 c5             	movslq %r13d,%rax
  401784:	eb 17                	jmp    40179d <rio_readlineb+0x10f>
  401786:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40178d:	eb 0e                	jmp    40179d <rio_readlineb+0x10f>
  40178f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401796:	eb 05                	jmp    40179d <rio_readlineb+0x10f>
  401798:	b8 00 00 00 00       	mov    $0x0,%eax
  40179d:	48 83 c4 38          	add    $0x38,%rsp
  4017a1:	5b                   	pop    %rbx
  4017a2:	5d                   	pop    %rbp
  4017a3:	41 5c                	pop    %r12
  4017a5:	41 5d                	pop    %r13
  4017a7:	41 5e                	pop    %r14
  4017a9:	41 5f                	pop    %r15
  4017ab:	c3                   	retq

00000000004017ac <submitr>:
  4017ac:	41 57                	push   %r15
  4017ae:	41 56                	push   %r14
  4017b0:	41 55                	push   %r13
  4017b2:	41 54                	push   %r12
  4017b4:	55                   	push   %rbp
  4017b5:	53                   	push   %rbx
  4017b6:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  4017bd:	48 89 fd             	mov    %rdi,%rbp
  4017c0:	41 89 f5             	mov    %esi,%r13d
  4017c3:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
  4017c8:	48 89 4c 24 18       	mov    %rcx,0x18(%rsp)
  4017cd:	4d 89 c7             	mov    %r8,%r15
  4017d0:	4c 89 cb             	mov    %r9,%rbx
  4017d3:	4c 8b b4 24 a0 a0 00 	mov    0xa0a0(%rsp),%r14
  4017da:	00
  4017db:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4017e2:	00 00
  4017e4:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  4017eb:	00
  4017ec:	31 c0                	xor    %eax,%eax
  4017ee:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  4017f5:	00
  4017f6:	ba 00 00 00 00       	mov    $0x0,%edx
  4017fb:	be 01 00 00 00       	mov    $0x1,%esi
  401800:	bf 02 00 00 00       	mov    $0x2,%edi
  401805:	e8 76 f4 ff ff       	callq  400c80 <socket@plt>
  40180a:	41 89 c4             	mov    %eax,%r12d
  40180d:	85 c0                	test   %eax,%eax
  40180f:	79 50                	jns    401861 <submitr+0xb5>
  401811:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401818:	3a 20 43
  40181b:	49 89 06             	mov    %rax,(%r14)
  40181e:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401825:	20 75 6e
  401828:	49 89 46 08          	mov    %rax,0x8(%r14)
  40182c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401833:	74 6f 20
  401836:	49 89 46 10          	mov    %rax,0x10(%r14)
  40183a:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  401841:	65 20 73
  401844:	49 89 46 18          	mov    %rax,0x18(%r14)
  401848:	41 c7 46 20 6f 63 6b 	movl   $0x656b636f,0x20(%r14)
  40184f:	65
  401850:	66 41 c7 46 24 74 00 	movw   $0x74,0x24(%r14)
  401857:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40185c:	e9 07 06 00 00       	jmpq   401e68 <submitr+0x6bc>
  401861:	48 89 ef             	mov    %rbp,%rdi
  401864:	e8 37 f3 ff ff       	callq  400ba0 <gethostbyname@plt>
  401869:	48 85 c0             	test   %rax,%rax
  40186c:	75 6b                	jne    4018d9 <submitr+0x12d>
  40186e:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  401875:	3a 20 44
  401878:	49 89 06             	mov    %rax,(%r14)
  40187b:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  401882:	20 75 6e
  401885:	49 89 46 08          	mov    %rax,0x8(%r14)
  401889:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401890:	74 6f 20
  401893:	49 89 46 10          	mov    %rax,0x10(%r14)
  401897:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  40189e:	76 65 20
  4018a1:	49 89 46 18          	mov    %rax,0x18(%r14)
  4018a5:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4018ac:	72 20 61
  4018af:	49 89 46 20          	mov    %rax,0x20(%r14)
  4018b3:	41 c7 46 28 64 64 72 	movl   $0x65726464,0x28(%r14)
  4018ba:	65
  4018bb:	66 41 c7 46 2c 73 73 	movw   $0x7373,0x2c(%r14)
  4018c2:	41 c6 46 2e 00       	movb   $0x0,0x2e(%r14)
  4018c7:	44 89 e7             	mov    %r12d,%edi
  4018ca:	e8 81 f2 ff ff       	callq  400b50 <close@plt>
  4018cf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4018d4:	e9 8f 05 00 00       	jmpq   401e68 <submitr+0x6bc>
  4018d9:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  4018e0:	00 00
  4018e2:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  4018e9:	00 00
  4018eb:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  4018f2:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4018f6:	48 8b 40 18          	mov    0x18(%rax),%rax
  4018fa:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  4018ff:	b9 0c 00 00 00       	mov    $0xc,%ecx
  401904:	48 8b 30             	mov    (%rax),%rsi
  401907:	e8 a4 f2 ff ff       	callq  400bb0 <__memmove_chk@plt>
  40190c:	66 41 c1 cd 08       	ror    $0x8,%r13w
  401911:	66 44 89 6c 24 32    	mov    %r13w,0x32(%rsp)
  401917:	ba 10 00 00 00       	mov    $0x10,%edx
  40191c:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  401921:	44 89 e7             	mov    %r12d,%edi
  401924:	e8 07 f3 ff ff       	callq  400c30 <connect@plt>
  401929:	85 c0                	test   %eax,%eax
  40192b:	79 5d                	jns    40198a <submitr+0x1de>
  40192d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  401934:	3a 20 55
  401937:	49 89 06             	mov    %rax,(%r14)
  40193a:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  401941:	20 74 6f
  401944:	49 89 46 08          	mov    %rax,0x8(%r14)
  401948:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  40194f:	65 63 74
  401952:	49 89 46 10          	mov    %rax,0x10(%r14)
  401956:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  40195d:	68 65 20
  401960:	49 89 46 18          	mov    %rax,0x18(%r14)
  401964:	41 c7 46 20 73 65 72 	movl   $0x76726573,0x20(%r14)
  40196b:	76
  40196c:	66 41 c7 46 24 65 72 	movw   $0x7265,0x24(%r14)
  401973:	41 c6 46 26 00       	movb   $0x0,0x26(%r14)
  401978:	44 89 e7             	mov    %r12d,%edi
  40197b:	e8 d0 f1 ff ff       	callq  400b50 <close@plt>
  401980:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401985:	e9 de 04 00 00       	jmpq   401e68 <submitr+0x6bc>
  40198a:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401991:	48 89 df             	mov    %rbx,%rdi
  401994:	b8 00 00 00 00       	mov    $0x0,%eax
  401999:	48 89 d1             	mov    %rdx,%rcx
  40199c:	f2 ae                	repnz scas %es:(%rdi),%al
  40199e:	48 f7 d1             	not    %rcx
  4019a1:	48 89 ce             	mov    %rcx,%rsi
  4019a4:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  4019a9:	48 89 d1             	mov    %rdx,%rcx
  4019ac:	f2 ae                	repnz scas %es:(%rdi),%al
  4019ae:	49 89 c8             	mov    %rcx,%r8
  4019b1:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  4019b6:	48 89 d1             	mov    %rdx,%rcx
  4019b9:	f2 ae                	repnz scas %es:(%rdi),%al
  4019bb:	48 f7 d1             	not    %rcx
  4019be:	49 89 c9             	mov    %rcx,%r9
  4019c1:	4c 89 ff             	mov    %r15,%rdi
  4019c4:	48 89 d1             	mov    %rdx,%rcx
  4019c7:	f2 ae                	repnz scas %es:(%rdi),%al
  4019c9:	4d 29 c1             	sub    %r8,%r9
  4019cc:	49 29 c9             	sub    %rcx,%r9
  4019cf:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  4019d4:	49 8d 44 01 7b       	lea    0x7b(%r9,%rax,1),%rax
  4019d9:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  4019df:	76 73                	jbe    401a54 <submitr+0x2a8>
  4019e1:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4019e8:	3a 20 52
  4019eb:	49 89 06             	mov    %rax,(%r14)
  4019ee:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4019f5:	20 73 74
  4019f8:	49 89 46 08          	mov    %rax,0x8(%r14)
  4019fc:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  401a03:	74 6f 6f
  401a06:	49 89 46 10          	mov    %rax,0x10(%r14)
  401a0a:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  401a11:	65 2e 20
  401a14:	49 89 46 18          	mov    %rax,0x18(%r14)
  401a18:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  401a1f:	61 73 65
  401a22:	49 89 46 20          	mov    %rax,0x20(%r14)
  401a26:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  401a2d:	49 54 52
  401a30:	49 89 46 28          	mov    %rax,0x28(%r14)
  401a34:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  401a3b:	55 46 00
  401a3e:	49 89 46 30          	mov    %rax,0x30(%r14)
  401a42:	44 89 e7             	mov    %r12d,%edi
  401a45:	e8 06 f1 ff ff       	callq  400b50 <close@plt>
  401a4a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401a4f:	e9 14 04 00 00       	jmpq   401e68 <submitr+0x6bc>
  401a54:	48 8d 94 24 40 20 00 	lea    0x2040(%rsp),%rdx
  401a5b:	00
  401a5c:	b9 00 04 00 00       	mov    $0x400,%ecx
  401a61:	b8 00 00 00 00       	mov    $0x0,%eax
  401a66:	48 89 d7             	mov    %rdx,%rdi
  401a69:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401a6c:	48 89 df             	mov    %rbx,%rdi
  401a6f:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401a76:	f2 ae                	repnz scas %es:(%rdi),%al
  401a78:	48 f7 d1             	not    %rcx
  401a7b:	48 83 e9 01          	sub    $0x1,%rcx
  401a7f:	85 c9                	test   %ecx,%ecx
  401a81:	0f 84 fd 03 00 00    	je     401e84 <submitr+0x6d8>
  401a87:	83 e9 01             	sub    $0x1,%ecx
  401a8a:	4c 8d 6c 0b 01       	lea    0x1(%rbx,%rcx,1),%r13
  401a8f:	48 89 d5             	mov    %rdx,%rbp
  401a92:	44 0f b6 03          	movzbl (%rbx),%r8d
  401a96:	41 80 f8 2a          	cmp    $0x2a,%r8b
  401a9a:	74 23                	je     401abf <submitr+0x313>
  401a9c:	41 8d 40 d3          	lea    -0x2d(%r8),%eax
  401aa0:	3c 01                	cmp    $0x1,%al
  401aa2:	76 1b                	jbe    401abf <submitr+0x313>
  401aa4:	41 80 f8 5f          	cmp    $0x5f,%r8b
  401aa8:	74 15                	je     401abf <submitr+0x313>
  401aaa:	41 8d 40 d0          	lea    -0x30(%r8),%eax
  401aae:	3c 09                	cmp    $0x9,%al
  401ab0:	76 0d                	jbe    401abf <submitr+0x313>
  401ab2:	44 89 c0             	mov    %r8d,%eax
  401ab5:	83 e0 df             	and    $0xffffffdf,%eax
  401ab8:	83 e8 41             	sub    $0x41,%eax
  401abb:	3c 19                	cmp    $0x19,%al
  401abd:	77 0a                	ja     401ac9 <submitr+0x31d>
  401abf:	48 8d 45 01          	lea    0x1(%rbp),%rax
  401ac3:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  401ac7:	eb 6c                	jmp    401b35 <submitr+0x389>
  401ac9:	41 80 f8 20          	cmp    $0x20,%r8b
  401acd:	75 0a                	jne    401ad9 <submitr+0x32d>
  401acf:	48 8d 45 01          	lea    0x1(%rbp),%rax
  401ad3:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401ad7:	eb 5c                	jmp    401b35 <submitr+0x389>
  401ad9:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  401add:	3c 5f                	cmp    $0x5f,%al
  401adf:	76 0a                	jbe    401aeb <submitr+0x33f>
  401ae1:	41 80 f8 09          	cmp    $0x9,%r8b
  401ae5:	0f 85 02 04 00 00    	jne    401eed <submitr+0x741>
  401aeb:	45 0f b6 c0          	movzbl %r8b,%r8d
  401aef:	b9 48 27 40 00       	mov    $0x402748,%ecx
  401af4:	ba 08 00 00 00       	mov    $0x8,%edx
  401af9:	be 01 00 00 00       	mov    $0x1,%esi
  401afe:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401b05:	00
  401b06:	b8 00 00 00 00       	mov    $0x0,%eax
  401b0b:	e8 60 f1 ff ff       	callq  400c70 <__sprintf_chk@plt>
  401b10:	0f b6 84 24 40 80 00 	movzbl 0x8040(%rsp),%eax
  401b17:	00
  401b18:	88 45 00             	mov    %al,0x0(%rbp)
  401b1b:	0f b6 84 24 41 80 00 	movzbl 0x8041(%rsp),%eax
  401b22:	00
  401b23:	88 45 01             	mov    %al,0x1(%rbp)
  401b26:	48 8d 45 03          	lea    0x3(%rbp),%rax
  401b2a:	0f b6 94 24 42 80 00 	movzbl 0x8042(%rsp),%edx
  401b31:	00
  401b32:	88 55 02             	mov    %dl,0x2(%rbp)
  401b35:	48 83 c3 01          	add    $0x1,%rbx
  401b39:	4c 39 eb             	cmp    %r13,%rbx
  401b3c:	0f 84 42 03 00 00    	je     401e84 <submitr+0x6d8>
  401b42:	48 89 c5             	mov    %rax,%rbp
  401b45:	e9 48 ff ff ff       	jmpq   401a92 <submitr+0x2e6>
  401b4a:	48 89 da             	mov    %rbx,%rdx
  401b4d:	48 89 ee             	mov    %rbp,%rsi
  401b50:	44 89 e7             	mov    %r12d,%edi
  401b53:	e8 c8 ef ff ff       	callq  400b20 <write@plt>
  401b58:	48 85 c0             	test   %rax,%rax
  401b5b:	7f 0f                	jg     401b6c <submitr+0x3c0>
  401b5d:	e8 8e ef ff ff       	callq  400af0 <__errno_location@plt>
  401b62:	83 38 04             	cmpl   $0x4,(%rax)
  401b65:	75 12                	jne    401b79 <submitr+0x3cd>
  401b67:	b8 00 00 00 00       	mov    $0x0,%eax
  401b6c:	48 01 c5             	add    %rax,%rbp
  401b6f:	48 29 c3             	sub    %rax,%rbx
  401b72:	75 d6                	jne    401b4a <submitr+0x39e>
  401b74:	4d 85 ed             	test   %r13,%r13
  401b77:	79 5f                	jns    401bd8 <submitr+0x42c>
  401b79:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401b80:	3a 20 43
  401b83:	49 89 06             	mov    %rax,(%r14)
  401b86:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401b8d:	20 75 6e
  401b90:	49 89 46 08          	mov    %rax,0x8(%r14)
  401b94:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401b9b:	74 6f 20
  401b9e:	49 89 46 10          	mov    %rax,0x10(%r14)
  401ba2:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  401ba9:	20 74 6f
  401bac:	49 89 46 18          	mov    %rax,0x18(%r14)
  401bb0:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
  401bb7:	73 65 72
  401bba:	49 89 46 20          	mov    %rax,0x20(%r14)
  401bbe:	41 c7 46 28 76 65 72 	movl   $0x726576,0x28(%r14)
  401bc5:	00
  401bc6:	44 89 e7             	mov    %r12d,%edi
  401bc9:	e8 82 ef ff ff       	callq  400b50 <close@plt>
  401bce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401bd3:	e9 90 02 00 00       	jmpq   401e68 <submitr+0x6bc>
  401bd8:	44 89 a4 24 40 80 00 	mov    %r12d,0x8040(%rsp)
  401bdf:	00
  401be0:	c7 84 24 44 80 00 00 	movl   $0x0,0x8044(%rsp)
  401be7:	00 00 00 00
  401beb:	48 8d 84 24 50 80 00 	lea    0x8050(%rsp),%rax
  401bf2:	00
  401bf3:	48 89 84 24 48 80 00 	mov    %rax,0x8048(%rsp)
  401bfa:	00
  401bfb:	ba 00 20 00 00       	mov    $0x2000,%edx
  401c00:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  401c05:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401c0c:	00
  401c0d:	e8 7c fa ff ff       	callq  40168e <rio_readlineb>
  401c12:	48 85 c0             	test   %rax,%rax
  401c15:	7f 74                	jg     401c8b <submitr+0x4df>
  401c17:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401c1e:	3a 20 43
  401c21:	49 89 06             	mov    %rax,(%r14)
  401c24:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401c2b:	20 75 6e
  401c2e:	49 89 46 08          	mov    %rax,0x8(%r14)
  401c32:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401c39:	74 6f 20
  401c3c:	49 89 46 10          	mov    %rax,0x10(%r14)
  401c40:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  401c47:	66 69 72
  401c4a:	49 89 46 18          	mov    %rax,0x18(%r14)
  401c4e:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  401c55:	61 64 65
  401c58:	49 89 46 20          	mov    %rax,0x20(%r14)
  401c5c:	48 b8 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rax
  401c63:	6d 20 73
  401c66:	49 89 46 28          	mov    %rax,0x28(%r14)
  401c6a:	41 c7 46 30 65 72 76 	movl   $0x65767265,0x30(%r14)
  401c71:	65
  401c72:	66 41 c7 46 34 72 00 	movw   $0x72,0x34(%r14)
  401c79:	44 89 e7             	mov    %r12d,%edi
  401c7c:	e8 cf ee ff ff       	callq  400b50 <close@plt>
  401c81:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c86:	e9 dd 01 00 00       	jmpq   401e68 <submitr+0x6bc>
  401c8b:	4c 8d 84 24 40 60 00 	lea    0x6040(%rsp),%r8
  401c92:	00
  401c93:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  401c98:	48 8d 94 24 40 40 00 	lea    0x4040(%rsp),%rdx
  401c9f:	00
  401ca0:	be 4f 27 40 00       	mov    $0x40274f,%esi
  401ca5:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401caa:	b8 00 00 00 00       	mov    $0x0,%eax
  401caf:	e8 3c ef ff ff       	callq  400bf0 <__isoc99_sscanf@plt>
  401cb4:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  401cb9:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  401cc0:	0f 84 be 00 00 00    	je     401d84 <submitr+0x5d8>
  401cc6:	4c 8d 8c 24 40 60 00 	lea    0x6040(%rsp),%r9
  401ccd:	00
  401cce:	b9 a0 26 40 00       	mov    $0x4026a0,%ecx
  401cd3:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401cda:	be 01 00 00 00       	mov    $0x1,%esi
  401cdf:	4c 89 f7             	mov    %r14,%rdi
  401ce2:	b8 00 00 00 00       	mov    $0x0,%eax
  401ce7:	e8 84 ef ff ff       	callq  400c70 <__sprintf_chk@plt>
  401cec:	44 89 e7             	mov    %r12d,%edi
  401cef:	e8 5c ee ff ff       	callq  400b50 <close@plt>
  401cf4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401cf9:	e9 6a 01 00 00       	jmpq   401e68 <submitr+0x6bc>
  401cfe:	ba 00 20 00 00       	mov    $0x2000,%edx
  401d03:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  401d08:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401d0f:	00
  401d10:	e8 79 f9 ff ff       	callq  40168e <rio_readlineb>
  401d15:	48 85 c0             	test   %rax,%rax
  401d18:	7f 6a                	jg     401d84 <submitr+0x5d8>
  401d1a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401d21:	3a 20 43
  401d24:	49 89 06             	mov    %rax,(%r14)
  401d27:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401d2e:	20 75 6e
  401d31:	49 89 46 08          	mov    %rax,0x8(%r14)
  401d35:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401d3c:	74 6f 20
  401d3f:	49 89 46 10          	mov    %rax,0x10(%r14)
  401d43:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  401d4a:	68 65 61
  401d4d:	49 89 46 18          	mov    %rax,0x18(%r14)
  401d51:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  401d58:	66 72 6f
  401d5b:	49 89 46 20          	mov    %rax,0x20(%r14)
  401d5f:	48 b8 6d 20 73 65 72 	movabs $0x726576726573206d,%rax
  401d66:	76 65 72
  401d69:	49 89 46 28          	mov    %rax,0x28(%r14)
  401d6d:	41 c6 46 30 00       	movb   $0x0,0x30(%r14)
  401d72:	44 89 e7             	mov    %r12d,%edi
  401d75:	e8 d6 ed ff ff       	callq  400b50 <close@plt>
  401d7a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d7f:	e9 e4 00 00 00       	jmpq   401e68 <submitr+0x6bc>
  401d84:	80 7c 24 40 0d       	cmpb   $0xd,0x40(%rsp)
  401d89:	0f 85 6f ff ff ff    	jne    401cfe <submitr+0x552>
  401d8f:	80 7c 24 41 0a       	cmpb   $0xa,0x41(%rsp)
  401d94:	0f 85 64 ff ff ff    	jne    401cfe <submitr+0x552>
  401d9a:	80 7c 24 42 00       	cmpb   $0x0,0x42(%rsp)
  401d9f:	0f 85 59 ff ff ff    	jne    401cfe <submitr+0x552>
  401da5:	ba 00 20 00 00       	mov    $0x2000,%edx
  401daa:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  401daf:	48 8d bc 24 40 80 00 	lea    0x8040(%rsp),%rdi
  401db6:	00
  401db7:	e8 d2 f8 ff ff       	callq  40168e <rio_readlineb>
  401dbc:	48 85 c0             	test   %rax,%rax
  401dbf:	7f 70                	jg     401e31 <submitr+0x685>
  401dc1:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401dc8:	3a 20 43
  401dcb:	49 89 06             	mov    %rax,(%r14)
  401dce:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401dd5:	20 75 6e
  401dd8:	49 89 46 08          	mov    %rax,0x8(%r14)
  401ddc:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401de3:	74 6f 20
  401de6:	49 89 46 10          	mov    %rax,0x10(%r14)
  401dea:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  401df1:	73 74 61
  401df4:	49 89 46 18          	mov    %rax,0x18(%r14)
  401df8:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  401dff:	65 73 73
  401e02:	49 89 46 20          	mov    %rax,0x20(%r14)
  401e06:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  401e0d:	72 6f 6d
  401e10:	49 89 46 28          	mov    %rax,0x28(%r14)
  401e14:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  401e1b:	65 72 00
  401e1e:	49 89 46 30          	mov    %rax,0x30(%r14)
  401e22:	44 89 e7             	mov    %r12d,%edi
  401e25:	e8 26 ed ff ff       	callq  400b50 <close@plt>
  401e2a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401e2f:	eb 37                	jmp    401e68 <submitr+0x6bc>
  401e31:	48 8d 74 24 40       	lea    0x40(%rsp),%rsi
  401e36:	4c 89 f7             	mov    %r14,%rdi
  401e39:	e8 c2 ec ff ff       	callq  400b00 <strcpy@plt>
  401e3e:	44 89 e7             	mov    %r12d,%edi
  401e41:	e8 0a ed ff ff       	callq  400b50 <close@plt>
  401e46:	41 0f b6 06          	movzbl (%r14),%eax
  401e4a:	83 e8 4f             	sub    $0x4f,%eax
  401e4d:	75 0f                	jne    401e5e <submitr+0x6b2>
  401e4f:	41 0f b6 46 01       	movzbl 0x1(%r14),%eax
  401e54:	83 e8 4b             	sub    $0x4b,%eax
  401e57:	75 05                	jne    401e5e <submitr+0x6b2>
  401e59:	41 0f b6 46 02       	movzbl 0x2(%r14),%eax
  401e5e:	85 c0                	test   %eax,%eax
  401e60:	0f 95 c0             	setne  %al
  401e63:	0f b6 c0             	movzbl %al,%eax
  401e66:	f7 d8                	neg    %eax
  401e68:	48 8b 94 24 58 a0 00 	mov    0xa058(%rsp),%rdx
  401e6f:	00
  401e70:	64 48 33 14 25 28 00 	xor    %fs:0x28,%rdx
  401e77:	00 00
  401e79:	0f 84 00 01 00 00    	je     401f7f <submitr+0x7d3>
  401e7f:	e9 f6 00 00 00       	jmpq   401f7a <submitr+0x7ce>
  401e84:	48 8d 84 24 40 20 00 	lea    0x2040(%rsp),%rax
  401e8b:	00
  401e8c:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  401e91:	4c 89 3c 24          	mov    %r15,(%rsp)
  401e95:	4c 8b 4c 24 18       	mov    0x18(%rsp),%r9
  401e9a:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
  401e9f:	b9 d0 26 40 00       	mov    $0x4026d0,%ecx
  401ea4:	ba 00 20 00 00       	mov    $0x2000,%edx
  401ea9:	be 01 00 00 00       	mov    $0x1,%esi
  401eae:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401eb3:	b8 00 00 00 00       	mov    $0x0,%eax
  401eb8:	e8 b3 ed ff ff       	callq  400c70 <__sprintf_chk@plt>
  401ebd:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401ec2:	b8 00 00 00 00       	mov    $0x0,%eax
  401ec7:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401ece:	f2 ae                	repnz scas %es:(%rdi),%al
  401ed0:	48 f7 d1             	not    %rcx
  401ed3:	48 83 e9 01          	sub    $0x1,%rcx
  401ed7:	49 89 cd             	mov    %rcx,%r13
  401eda:	0f 84 f8 fc ff ff    	je     401bd8 <submitr+0x42c>
  401ee0:	48 89 cb             	mov    %rcx,%rbx
  401ee3:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
  401ee8:	e9 5d fc ff ff       	jmpq   401b4a <submitr+0x39e>
  401eed:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  401ef4:	3a 20 52
  401ef7:	49 89 06             	mov    %rax,(%r14)
  401efa:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  401f01:	20 73 74
  401f04:	49 89 46 08          	mov    %rax,0x8(%r14)
  401f08:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  401f0f:	63 6f 6e
  401f12:	49 89 46 10          	mov    %rax,0x10(%r14)
  401f16:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  401f1d:	20 61 6e
  401f20:	49 89 46 18          	mov    %rax,0x18(%r14)
  401f24:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  401f2b:	67 61 6c
  401f2e:	49 89 46 20          	mov    %rax,0x20(%r14)
  401f32:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  401f39:	6e 70 72
  401f3c:	49 89 46 28          	mov    %rax,0x28(%r14)
  401f40:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  401f47:	6c 65 20
  401f4a:	49 89 46 30          	mov    %rax,0x30(%r14)
  401f4e:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  401f55:	63 74 65
  401f58:	49 89 46 38          	mov    %rax,0x38(%r14)
  401f5c:	66 41 c7 46 40 72 2e 	movw   $0x2e72,0x40(%r14)
  401f63:	41 c6 46 42 00       	movb   $0x0,0x42(%r14)
  401f68:	44 89 e7             	mov    %r12d,%edi
  401f6b:	e8 e0 eb ff ff       	callq  400b50 <close@plt>
  401f70:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f75:	e9 ee fe ff ff       	jmpq   401e68 <submitr+0x6bc>
  401f7a:	e8 b1 eb ff ff       	callq  400b30 <__stack_chk_fail@plt>
  401f7f:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  401f86:	5b                   	pop    %rbx
  401f87:	5d                   	pop    %rbp
  401f88:	41 5c                	pop    %r12
  401f8a:	41 5d                	pop    %r13
  401f8c:	41 5e                	pop    %r14
  401f8e:	41 5f                	pop    %r15
  401f90:	c3                   	retq

0000000000401f91 <init_timeout>:
  401f91:	53                   	push   %rbx
  401f92:	89 fb                	mov    %edi,%ebx
  401f94:	85 ff                	test   %edi,%edi
  401f96:	74 1e                	je     401fb6 <init_timeout+0x25>
  401f98:	be 60 16 40 00       	mov    $0x401660,%esi
  401f9d:	bf 0e 00 00 00       	mov    $0xe,%edi
  401fa2:	e8 e9 eb ff ff       	callq  400b90 <signal@plt>
  401fa7:	85 db                	test   %ebx,%ebx
  401fa9:	bf 00 00 00 00       	mov    $0x0,%edi
  401fae:	0f 49 fb             	cmovns %ebx,%edi
  401fb1:	e8 8a eb ff ff       	callq  400b40 <alarm@plt>
  401fb6:	5b                   	pop    %rbx
  401fb7:	c3                   	retq

0000000000401fb8 <init_driver>:
  401fb8:	55                   	push   %rbp
  401fb9:	53                   	push   %rbx
  401fba:	48 83 ec 28          	sub    $0x28,%rsp
  401fbe:	48 89 fd             	mov    %rdi,%rbp
  401fc1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401fc8:	00 00
  401fca:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  401fcf:	31 c0                	xor    %eax,%eax
  401fd1:	be 01 00 00 00       	mov    $0x1,%esi
  401fd6:	bf 0d 00 00 00       	mov    $0xd,%edi
  401fdb:	e8 b0 eb ff ff       	callq  400b90 <signal@plt>
  401fe0:	be 01 00 00 00       	mov    $0x1,%esi
  401fe5:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401fea:	e8 a1 eb ff ff       	callq  400b90 <signal@plt>
  401fef:	be 01 00 00 00       	mov    $0x1,%esi
  401ff4:	bf 1d 00 00 00       	mov    $0x1d,%edi
  401ff9:	e8 92 eb ff ff       	callq  400b90 <signal@plt>
  401ffe:	ba 00 00 00 00       	mov    $0x0,%edx
  402003:	be 01 00 00 00       	mov    $0x1,%esi
  402008:	bf 02 00 00 00       	mov    $0x2,%edi
  40200d:	e8 6e ec ff ff       	callq  400c80 <socket@plt>
  402012:	89 c3                	mov    %eax,%ebx
  402014:	85 c0                	test   %eax,%eax
  402016:	79 4f                	jns    402067 <init_driver+0xaf>
  402018:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40201f:	3a 20 43
  402022:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402026:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40202d:	20 75 6e
  402030:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402034:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40203b:	74 6f 20
  40203e:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402042:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402049:	65 20 73
  40204c:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402050:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402057:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  40205d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402062:	e9 0a 01 00 00       	jmpq   402171 <init_driver+0x1b9>
  402067:	bf 60 27 40 00       	mov    $0x402760,%edi
  40206c:	e8 2f eb ff ff       	callq  400ba0 <gethostbyname@plt>
  402071:	48 85 c0             	test   %rax,%rax
  402074:	75 68                	jne    4020de <init_driver+0x126>
  402076:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  40207d:	3a 20 44
  402080:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402084:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  40208b:	20 75 6e
  40208e:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402092:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402099:	74 6f 20
  40209c:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4020a0:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4020a7:	76 65 20
  4020aa:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4020ae:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4020b5:	72 20 61
  4020b8:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4020bc:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4020c3:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4020c9:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4020cd:	89 df                	mov    %ebx,%edi
  4020cf:	e8 7c ea ff ff       	callq  400b50 <close@plt>
  4020d4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020d9:	e9 93 00 00 00       	jmpq   402171 <init_driver+0x1b9>
  4020de:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4020e5:	00
  4020e6:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4020ed:	00 00
  4020ef:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4020f5:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4020f9:	48 8b 40 18          	mov    0x18(%rax),%rax
  4020fd:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  402102:	b9 0c 00 00 00       	mov    $0xc,%ecx
  402107:	48 8b 30             	mov    (%rax),%rsi
  40210a:	e8 a1 ea ff ff       	callq  400bb0 <__memmove_chk@plt>
  40210f:	66 c7 44 24 02 3b 6e 	movw   $0x6e3b,0x2(%rsp)
  402116:	ba 10 00 00 00       	mov    $0x10,%edx
  40211b:	48 89 e6             	mov    %rsp,%rsi
  40211e:	89 df                	mov    %ebx,%edi
  402120:	e8 0b eb ff ff       	callq  400c30 <connect@plt>
  402125:	85 c0                	test   %eax,%eax
  402127:	79 32                	jns    40215b <init_driver+0x1a3>
  402129:	41 b8 60 27 40 00    	mov    $0x402760,%r8d
  40212f:	b9 20 27 40 00       	mov    $0x402720,%ecx
  402134:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40213b:	be 01 00 00 00       	mov    $0x1,%esi
  402140:	48 89 ef             	mov    %rbp,%rdi
  402143:	b8 00 00 00 00       	mov    $0x0,%eax
  402148:	e8 23 eb ff ff       	callq  400c70 <__sprintf_chk@plt>
  40214d:	89 df                	mov    %ebx,%edi
  40214f:	e8 fc e9 ff ff       	callq  400b50 <close@plt>
  402154:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402159:	eb 16                	jmp    402171 <init_driver+0x1b9>
  40215b:	89 df                	mov    %ebx,%edi
  40215d:	e8 ee e9 ff ff       	callq  400b50 <close@plt>
  402162:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402168:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  40216c:	b8 00 00 00 00       	mov    $0x0,%eax
  402171:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  402176:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  40217d:	00 00
  40217f:	74 05                	je     402186 <init_driver+0x1ce>
  402181:	e8 aa e9 ff ff       	callq  400b30 <__stack_chk_fail@plt>
  402186:	48 83 c4 28          	add    $0x28,%rsp
  40218a:	5b                   	pop    %rbx
  40218b:	5d                   	pop    %rbp
  40218c:	c3                   	retq

000000000040218d <driver_post>:
  40218d:	53                   	push   %rbx
  40218e:	48 83 ec 10          	sub    $0x10,%rsp
  402192:	48 89 cb             	mov    %rcx,%rbx
  402195:	85 d2                	test   %edx,%edx
  402197:	74 27                	je     4021c0 <driver_post+0x33>
  402199:	48 89 f2             	mov    %rsi,%rdx
  40219c:	be 78 27 40 00       	mov    $0x402778,%esi
  4021a1:	bf 01 00 00 00       	mov    $0x1,%edi
  4021a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ab:	e8 50 ea ff ff       	callq  400c00 <__printf_chk@plt>
  4021b0:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4021b5:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4021b9:	b8 00 00 00 00       	mov    $0x0,%eax
  4021be:	eb 3e                	jmp    4021fe <driver_post+0x71>
  4021c0:	48 85 ff             	test   %rdi,%rdi
  4021c3:	74 2b                	je     4021f0 <driver_post+0x63>
  4021c5:	80 3f 00             	cmpb   $0x0,(%rdi)
  4021c8:	74 26                	je     4021f0 <driver_post+0x63>
  4021ca:	48 89 0c 24          	mov    %rcx,(%rsp)
  4021ce:	49 89 f1             	mov    %rsi,%r9
  4021d1:	41 b8 ec 22 40 00    	mov    $0x4022ec,%r8d
  4021d7:	48 89 f9             	mov    %rdi,%rcx
  4021da:	ba 8f 27 40 00       	mov    $0x40278f,%edx
  4021df:	be 6e 3b 00 00       	mov    $0x3b6e,%esi
  4021e4:	bf 60 27 40 00       	mov    $0x402760,%edi
  4021e9:	e8 be f5 ff ff       	callq  4017ac <submitr>
  4021ee:	eb 0e                	jmp    4021fe <driver_post+0x71>
  4021f0:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4021f5:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4021f9:	b8 00 00 00 00       	mov    $0x0,%eax
  4021fe:	48 83 c4 10          	add    $0x10,%rsp
  402202:	5b                   	pop    %rbx
  402203:	c3                   	retq
  402204:	90                   	nop
  402205:	90                   	nop
  402206:	90                   	nop
  402207:	90                   	nop
  402208:	90                   	nop
  402209:	90                   	nop
  40220a:	90                   	nop
  40220b:	90                   	nop
  40220c:	90                   	nop
  40220d:	90                   	nop
  40220e:	90                   	nop
  40220f:	90                   	nop

0000000000402210 <__libc_csu_init>:
  402210:	48 89 6c 24 d8       	mov    %rbp,-0x28(%rsp)
  402215:	4c 89 64 24 e0       	mov    %r12,-0x20(%rsp)
  40221a:	48 8d 2d df 0b 20 00 	lea    0x200bdf(%rip),%rbp        # 602e00 <__init_array_end>
  402221:	4c 8d 25 d0 0b 20 00 	lea    0x200bd0(%rip),%r12        # 602df8 <__frame_dummy_init_array_entry>
  402228:	4c 89 6c 24 e8       	mov    %r13,-0x18(%rsp)
  40222d:	4c 89 74 24 f0       	mov    %r14,-0x10(%rsp)
  402232:	4c 89 7c 24 f8       	mov    %r15,-0x8(%rsp)
  402237:	48 89 5c 24 d0       	mov    %rbx,-0x30(%rsp)
  40223c:	48 83 ec 38          	sub    $0x38,%rsp
  402240:	4c 29 e5             	sub    %r12,%rbp
  402243:	41 89 fd             	mov    %edi,%r13d
  402246:	49 89 f6             	mov    %rsi,%r14
  402249:	48 c1 fd 03          	sar    $0x3,%rbp
  40224d:	49 89 d7             	mov    %rdx,%r15
  402250:	e8 6b e8 ff ff       	callq  400ac0 <_init>
  402255:	48 85 ed             	test   %rbp,%rbp
  402258:	74 1c                	je     402276 <__libc_csu_init+0x66>
  40225a:	31 db                	xor    %ebx,%ebx
  40225c:	0f 1f 40 00          	nopl   0x0(%rax)
  402260:	4c 89 fa             	mov    %r15,%rdx
  402263:	4c 89 f6             	mov    %r14,%rsi
  402266:	44 89 ef             	mov    %r13d,%edi
  402269:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40226d:	48 83 c3 01          	add    $0x1,%rbx
  402271:	48 39 eb             	cmp    %rbp,%rbx
  402274:	75 ea                	jne    402260 <__libc_csu_init+0x50>
  402276:	48 8b 5c 24 08       	mov    0x8(%rsp),%rbx
  40227b:	48 8b 6c 24 10       	mov    0x10(%rsp),%rbp
  402280:	4c 8b 64 24 18       	mov    0x18(%rsp),%r12
  402285:	4c 8b 6c 24 20       	mov    0x20(%rsp),%r13
  40228a:	4c 8b 74 24 28       	mov    0x28(%rsp),%r14
  40228f:	4c 8b 7c 24 30       	mov    0x30(%rsp),%r15
  402294:	48 83 c4 38          	add    $0x38,%rsp
  402298:	c3                   	retq
  402299:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000004022a0 <__libc_csu_fini>:
  4022a0:	f3 c3                	repz retq
  4022a2:	90                   	nop
  4022a3:	90                   	nop

Disassembly of section .fini:

00000000004022a4 <_fini>:
  4022a4:	48 83 ec 08          	sub    $0x8,%rsp
  4022a8:	48 83 c4 08          	add    $0x8,%rsp
  4022ac:	c3                   	retq
➜  /bomb objdump -d bomb > res.txt
➜  /bomb vi res.txt
➜  /bomb vi res.txt
zsh: command not found: res.txt
➜  /bomb ls
README  bomb  bomb.c  res.txt
➜  /bomb vim res.txt
➜  /bomb ls
README  bomb  bomb.c  res.txt

bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400ac0 <_init>:
  400ac0:       48 83 ec 08             sub    rsp,0x8
  400ac4:       e8 f3 01 00 00          call   400cbc <call_gmon_start>
  400ac9:       48 83 c4 08             add    rsp,0x8
  400acd:       c3                      ret

Disassembly of section .plt:

0000000000400ad0 <getenv@plt-0x10>:
  400ad0:       ff 35 1a 25 20 00       push   QWORD PTR [rip+0x20251a]        # 602ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
  400ad6:       ff 25 1c 25 20 00       jmp    QWORD PTR [rip+0x20251c]        # 602ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
  400adc:       0f 1f 40 00             nop    DWORD PTR [rax+0x0]

0000000000400ae0 <getenv@plt>:
  400ae0:       ff 25 1a 25 20 00       jmp    QWORD PTR [rip+0x20251a]        # 603000 <_GLOBAL_OFFSET_TABLE_+0x18>
  400ae6:       68 00 00 00 00          push   0x0
  400aeb:       e9 e0 ff ff ff          jmp    400ad0 <_init+0x10>

0000000000400af0 <__errno_location@plt>:
  400af0:       ff 25 12 25 20 00       jmp    QWORD PTR [rip+0x202512]        # 603008 <_GLOBAL_OFFSET_TABLE_+0x20>
  400af6:       68 01 00 00 00          push   0x1
  400afb:       e9 d0 ff ff ff          jmp    400ad0 <_init+0x10>

0000000000400b00 <strcpy@plt>:
  400b00:       ff 25 0a 25 20 00       jmp    QWORD PTR [rip+0x20250a]        # 603010 <_GLOBAL_OFFSET_TABLE_+0x28>
  400b06:       68 02 00 00 00          push   0x2
  400b0b:       e9 c0 ff ff ff          jmp    400ad0 <_init+0x10>

0000000000400b10 <puts@plt>:
"domb.asm" 1741L, 87362C                                                                    1,0-1         Top