Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2D93C7E6
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 11:58:59 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3FAF83EB0B5
	for <lists+linux-ltp@lfdr.de>; Tue, 11 Jun 2019 11:58:59 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id F0F993EA2FF
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 11:58:56 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id A64522009A6
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 11:58:54 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2A53C308FF32
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:58:52 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E1B608E4
 for <ltp@lists.linux.it>; Tue, 11 Jun 2019 09:58:52 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 175D0206D1;
 Tue, 11 Jun 2019 09:58:52 +0000 (UTC)
Date: Tue, 11 Jun 2019 05:58:48 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <750486973.27397698.1560247128601.JavaMail.zimbra@redhat.com>
In-Reply-To: <CAEemH2fK7GnT5Pmo4r1ik4bV=7=F5ZOtM+UQYieeDUz4O1G0eQ@mail.gmail.com>
References: <2abbf8596a01ea056f6e7c9e6c481d67093cea0c.1560238866.git.jstancek@redhat.com>
 <CAEemH2fK7GnT5Pmo4r1ik4bV=7=F5ZOtM+UQYieeDUz4O1G0eQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.43.17.163, 10.4.195.7]
Thread-Topic: syscalls/ioctl_ns01: fix crash on aarch64
Thread-Index: loeTEjP3mZlaooY6NCMfXdIgU60H3w==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Tue, 11 Jun 2019 09:58:52 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH] syscalls/ioctl_ns01: fix crash on aarch64
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1302561915=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1302561915==
Content-Type: multipart/alternative; 
	boundary="----=_Part_27397697_1408705879.1560247128598"

------=_Part_27397697_1408705879.1560247128598
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

----- Original Message -----

> On Tue, Jun 11, 2019 at 3:44 PM Jan Stancek < jstancek@redhat.com > wrote:

> > Test crashes with SIGBUS when using child stack. Align stack to 256 bytes,
> 
> > which is more than enough for any arch.
> 
> > Neither parent or library is waiting for child process. Add SIGCHLD to
> 
> > clone flags.
> 

> > Check return value of ltp_clone(), and TBROK on failure.
> 

> > Fix warning about unused *arg.
> 

> > Signed-off-by: Jan Stancek < jstancek@redhat.com >
> 
> > ---
> 
> > testcases/kernel/syscalls/ioctl/ioctl_ns01.c | 10 +++++++---
> 
> > 1 file changed, 7 insertions(+), 3 deletions(-)
> 

> > diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> > b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> 
> > index dfde4da6c5d6..625de9bd832d 100644
> 
> > --- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> 
> > +++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c
> 
> > @@ -23,7 +23,7 @@
> 

> > #define STACK_SIZE (1024 * 1024)
> 

> > -static char child_stack[STACK_SIZE];
> 
> > +static char child_stack[STACK_SIZE] __attribute__((aligned(256)));
> 

> This patch makes sense. And maybe we'd better change that for ioctl_nfs05/06
> too?

Yes, you're right. Trying an unaligned address yields same result: 

Starting program: /root/ltp/testcases/kernel/syscalls/ioctl/ioctl_ns05 
tst_test.c:1111: INFO: Timeout per run is 0h 05m 00s 
[Attaching after process 19449 fork to child process 19452] 
[New inferior 2 (process 19452)] 
[Detaching after fork from parent process 19449] 
[Inferior 1 (process 19449) detached] 
0x4306a0 
[New LWP 19453] 
ioctl_ns05.c:80: PASS: child and parent are consistent 

Thread 2.2 received signal SIGBUS, Bus error. 
[Switching to LWP 19453] 
child (arg=0x0) at ioctl_ns05.c:37 
37 if (getpid() != 1) 
(gdb) disassemble 
Dump of assembler code for function child: 
=> 0x00000000004032e8 <+0>: stp x29, x30, [sp, #-32]! 
0x00000000004032ec <+4>: mov x29, sp 
0x00000000004032f0 <+8>: str x19, [sp, #16] 

I'll send v2. 

Thanks, 
Jan 

> BTW, another way we could try is to allocate the child_stack memory
> dynamically via malloc(STACK_SIZE) in setup() function.

> > static void setup(void)
> 
> > {
> 
> > @@ -53,7 +53,7 @@ static void test_ns_get_parent(void)
> 
> > }
> 
> > }
> 

> > -static int child(void *arg)
> 
> > +static int child(void *arg LTP_ATTRIBUTE_UNUSED)
> 
> > {
> 
> > test_ns_get_parent();
> 
> > return 0;
> 
> > @@ -61,10 +61,14 @@ static int child(void *arg)
> 

> > static void run(void)
> 
> > {
> 
> > + int child_pid;
> 
> > +
> 
> > test_ns_get_parent();
> 

> > - ltp_clone(CLONE_NEWPID, &child, 0,
> 
> > + child_pid = ltp_clone(CLONE_NEWPID | SIGCHLD, &child, 0,
> 
> > STACK_SIZE, child_stack);
> 
> > + if (child_pid == -1)
> 
> > + tst_brk(TBROK | TERRNO, "ltp_clone failed");
> 
> > }
> 

> > static struct tst_test test = {
> 
> > --
> 
> > 1.8.3.1
> 

> > --
> 
> > Mailing list info: https://lists.linux.it/listinfo/ltp
> 

> --
> Regards,
> Li Wang

------=_Part_27397697_1408705879.1560247128598
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><body><div style=3D"font-family: times new roman, new york, times, se=
rif; font-size: 12pt; color: #000000"><div><br></div><div><br></div><hr id=
=3D"zwchr"><blockquote style=3D"border-left:2px solid #1010FF;margin-left:5=
px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-de=
coration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><div =
dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Jun 11, 2019 at 3:44 PM Jan Stancek &lt;<a href=
=3D"mailto:jstancek@redhat.com" target=3D"_blank">jstancek@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Test c=
rashes with SIGBUS when using child stack. Align stack to 256 bytes,<br>
which is more than enough for any arch.</blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex"><br>
Neither parent or library is waiting for child process. Add SIGCHLD to<br>
clone flags.<br><div><br></div>
Check return value of ltp_clone(), and TBROK on failure.<br><div><br></div>
Fix warning about unused *arg.<br><div><br></div>
Signed-off-by: Jan Stancek &lt;<a href=3D"mailto:jstancek@redhat.com" targe=
t=3D"_blank">jstancek@redhat.com</a>&gt;<br>
---<br>
&nbsp;testcases/kernel/syscalls/ioctl/ioctl_ns01.c | 10 +++++++---<br>
&nbsp;1 file changed, 7 insertions(+), 3 deletions(-)<br><div><br></div>
diff --git a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c b/testcases/kerne=
l/syscalls/ioctl/ioctl_ns01.c<br>
index dfde4da6c5d6..625de9bd832d 100644<br>
--- a/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
+++ b/testcases/kernel/syscalls/ioctl/ioctl_ns01.c<br>
@@ -23,7 +23,7 @@<br><div><br></div>
&nbsp;#define STACK_SIZE (1024 * 1024)<br><div><br></div>
-static char child_stack[STACK_SIZE];<br>
+static char child_stack[STACK_SIZE] __attribute__((aligned(256)));<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default">This patch makes =
sense. And maybe we'd better change that for ioctl_nfs05/06 too?</div></div=
></div></div></blockquote><div>Yes, you're right. Trying an unaligned addre=
ss yields same result:<br></div><div><br></div><div></div><div>Starting pro=
gram: /root/ltp/testcases/kernel/syscalls/ioctl/ioctl_ns05 <br>tst_test.c:1=
111: INFO: Timeout per run is 0h 05m 00s<br>[Attaching after process 19449 =
fork to child process 19452]<br>[New inferior 2 (process 19452)]<br>[Detach=
ing after fork from parent process 19449]<br>[Inferior 1 (process 19449) de=
tached]<br>0x4306a0<br>[New LWP 19453]<br>ioctl_ns05.c:80: PASS: child and =
parent are consistent<br><br>Thread 2.2 received signal SIGBUS, Bus error.<=
br>[Switching to LWP 19453]<br>child (arg=3D0x0) at ioctl_ns05.c:37<br>37&n=
bsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp;if (getpid() !=3D 1)<br>(gdb) disassemb=
le <br>Dump of assembler code for function child:<br>=3D&gt; 0x000000000040=
32e8 &lt;+0&gt;:&nbsp;&nbsp; &nbsp;stp&nbsp;&nbsp; &nbsp;x29, x30, [sp, #-3=
2]!<br>&nbsp;&nbsp; 0x00000000004032ec &lt;+4&gt;:&nbsp;&nbsp; &nbsp;mov&nb=
sp;&nbsp; &nbsp;x29, sp<br>&nbsp;&nbsp; 0x00000000004032f0 &lt;+8&gt;:&nbsp=
;&nbsp; &nbsp;str&nbsp;&nbsp; &nbsp;x19, [sp, #16]<br><br></div><div><br></=
div><div> I'll send v2.<br></div><div><br></div><div>Thanks,<br></div><div>=
Jan<br></div><blockquote style=3D"border-left:2px solid #1010FF;margin-left=
:5px;padding-left:5px;color:#000;font-weight:normal;font-style:normal;text-=
decoration:none;font-family:Helvetica,Arial,sans-serif;font-size:12pt;"><di=
v dir=3D"ltr"><div class=3D"gmail_quote"><div><div class=3D"gmail_default">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">BTW, anoth=
er way we could try is to allocate the child_stack memory dynamically via m=
alloc(STACK_SIZE) in setup() function.&nbsp;</div></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><br>
&nbsp;static void setup(void)<br>
&nbsp;{<br>
@@ -53,7 +53,7 @@ static void test_ns_get_parent(void)<br>
&nbsp; &nbsp; &nbsp; &nbsp; }<br>
&nbsp;}<br><div><br></div>
-static int child(void *arg)<br>
+static int child(void *arg LTP_ATTRIBUTE_UNUSED)<br>
&nbsp;{<br>
&nbsp; &nbsp; &nbsp; &nbsp; test_ns_get_parent();<br>
&nbsp; &nbsp; &nbsp; &nbsp; return 0;<br>
@@ -61,10 +61,14 @@ static int child(void *arg)<br><div><br></div>
&nbsp;static void run(void)<br>
&nbsp;{<br>
+&nbsp; &nbsp; &nbsp; &nbsp;int child_pid;<br>
+<br>
&nbsp; &nbsp; &nbsp; &nbsp; test_ns_get_parent();<br><div><br></div>
-&nbsp; &nbsp; &nbsp; &nbsp;ltp_clone(CLONE_NEWPID, &amp;child, 0,<br>
+&nbsp; &nbsp; &nbsp; &nbsp;child_pid =3D ltp_clone(CLONE_NEWPID | SIGCHLD,=
 &amp;child, 0,<br>
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; STACK_SIZE, child_s=
tack);<br>
+&nbsp; &nbsp; &nbsp; &nbsp;if (child_pid =3D=3D -1)<br>
+&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;tst_brk(TBROK | TER=
RNO, "ltp_clone failed");<br>
&nbsp;}<br><div><br></div>
&nbsp;static struct tst_test test =3D {<br>
-- <br>
1.8.3.1<br><div><br></div><br>
-- <br>
Mailing list info: <a href=3D"https://lists.linux.it/listinfo/ltp" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.linux.it/listinfo/ltp</a><br></b=
lockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wan=
g<br></div></div></div></div></blockquote><div><br></div></div></body></htm=
l>
------=_Part_27397697_1408705879.1560247128598--

--===============1302561915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1302561915==--
