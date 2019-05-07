Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E84D21B301
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 11:37:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B7E4D294AD4
	for <lists+linux-ltp@lfdr.de>; Mon, 13 May 2019 11:37:37 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 5D9763EA03A
 for <ltp@lists.linux.it>; Tue,  7 May 2019 10:59:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D20F9601193
 for <ltp@lists.linux.it>; Tue,  7 May 2019 10:59:45 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E9297ABAC;
 Tue,  7 May 2019 08:59:44 +0000 (UTC)
To: Li Wang <liwang@redhat.com>
References: <20190507065530.12174-1-camann@suse.com>
 <CAEemH2e=9J_7OtSsS5wq+4YgfOm1zj=PK5cnaBk69LKtdR71ZA@mail.gmail.com>
From: Christian Amann <camann@suse.de>
Openpgp: preference=signencrypt
Autocrypt: addr=camann@suse.de; keydata=
 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
 du2mz1Q=
Message-ID: <7f9b69db-12a2-6e88-7687-602b88ce8cd7@suse.de>
Date: Tue, 7 May 2019 10:59:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAEemH2e=9J_7OtSsS5wq+4YgfOm1zj=PK5cnaBk69LKtdR71ZA@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
X-Mailman-Approved-At: Mon, 13 May 2019 11:36:55 +0200
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v1] crypto/af_alg02: fixed read() being stuck
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
Content-Type: multipart/mixed; boundary="===============0226159435=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0226159435==
Content-Type: multipart/alternative;
 boundary="------------F37DA55FA47633BD29A384E3"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------F37DA55FA47633BD29A384E3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Li,

Thanks for having a look at my patch. To my knowledge
/pthread_timedjoin_np/ does not kill the thread if it times out. It
returns ETIMEDOUT which, in this case, leads to the whole testcase
terminating.

I chose this method over setting test.timeout because this way an
informative error-message can be printed.

I may be missing the problem here. Can you point me in the right
direction why this is bad practice?

Kind regards,

Christian


On 07/05/2019 10:07, Li Wang wrote:
> Hi=C2=A0Christian,
>
> On Tue, May 7, 2019 at 2:56 PM Christian Amann <camann@suse.com
> <mailto:camann@suse.com>> wrote:
>
>     On kernels < 4.14 (missing commit 2d97591ef43d) reading from
>     the request socket does not return and the testcase does not
>     finish.
>
>     This fix moves the logic to a child thread in order for the
>     parent to handle the timeout and report a message to the user.
>
>     Signed-off-by: Christian Amann <camann@suse.com
>     <mailto:camann@suse.com>>
>     ---
>     =C2=A0testcases/kernel/crypto/Makefile=C2=A0 =C2=A0|=C2=A0 2 ++
>     =C2=A0testcases/kernel/crypto/af_alg02.c | 36
>     +++++++++++++++++++++++++++++++++++-
>     =C2=A02 files changed, 37 insertions(+), 1 deletion(-)
>
>     diff --git a/testcases/kernel/crypto/Makefile
>     b/testcases/kernel/crypto/Makefile
>     index 76f9308c2..6547e1cb6 100644
>     --- a/testcases/kernel/crypto/Makefile
>     +++ b/testcases/kernel/crypto/Makefile
>     @@ -20,3 +20,5 @@ include $(top_srcdir)/include/mk/testcases.mk
>     <http://testcases.mk>
>     =C2=A0CFLAGS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0+=3D -D_GNU_SOURCE
>
>     =C2=A0include $(top_srcdir)/include/mk/generic_leaf_target.mk
>     <http://generic_leaf_target.mk>
>     +
>     +af_alg02: CFLAGS +=3D -pthread
>     diff --git a/testcases/kernel/crypto/af_alg02.c
>     b/testcases/kernel/crypto/af_alg02.c
>     index a9e820423..056511993 100644
>     --- a/testcases/kernel/crypto/af_alg02.c
>     +++ b/testcases/kernel/crypto/af_alg02.c
>     @@ -7,12 +7,23 @@
>     =C2=A0 * Regression test for commit ecaaab564978 ("crypto: salsa20 =
- fix
>     =C2=A0 * blkcipher_walk API usage"), or CVE-2017-17805.=C2=A0 This =
test
>     verifies that an
>     =C2=A0 * empty message can be encrypted with Salsa20 without crashi=
ng
>     the kernel.
>     + *
>     + * read() fix:
>     + * Calls read() in child thread in order to manually kill it
>     after timeout.
>     + * With kernels missing commit 2d97591ef43d ("crypto: af_alg -
>     consolidation
>     + * of duplicate code") read() does not return.
>     =C2=A0 */
>
>     =C2=A0#include "tst_test.h"
>     =C2=A0#include "tst_af_alg.h"
>     +#include "tst_safe_pthread.h"
>     +#include <pthread.h>
>     +#include <time.h>
>     +#include <errno.h>
>
>     -static void run(void)
>     +#define VERIFY_TIMEOUT (time(NULL) + 5)
>
>
> It is very neccessary to take some action before process being killed
> in timeout. In LTP, we have an tst_timeout_remaining() function. Have
> a look?
>
>     +
>     +void *verify_encrypt(void *arg)
>     =C2=A0{
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 char buf[16];
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 int reqfd =3D tst_alg_setup_reqfd("skci=
pher", "salsa20",
>     NULL, 16);
>     @@ -22,6 +33,29 @@ static void run(void)
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TPA=
SS, "Successfully \"encrypted\" an
>     empty message");
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tst_res(TBR=
OK, "read() didn't return 0");
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0return arg;
>     +}
>     +
>     +static void run(void)
>     +{
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0pthread_t thr;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0int join_ret;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct timespec read_timeout;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0read_timeout.tv_sec=C2=A0 =3D VERIFY_TI=
MEOUT;
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0read_timeout.tv_nsec =3D 0;
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0SAFE_PTHREAD_CREATE(&thr, NULL, verify_=
encrypt, NULL);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0join_ret =3D pthread_timedjoin_np(thr, =
NULL, &read_timeout);
>     +
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (join_ret !=3D 0) {
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (join_re=
t =3D=3D ETIMEDOUT)
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tst_brk(TBROK,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Timed out while reading fro=
m
>     request socket.");
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0tst_brk(TBROK | TTERRNO,
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Error while joining child t=
hread");
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     =C2=A0}
>
>     =C2=A0static struct tst_test test =3D {
>     --=20
>     2.16.4
>
>
>     --=20
>     Mailing list info: https://lists.linux.it/listinfo/ltp
>
>
>
> --=20
> Regards,
> Li Wang

--------------F37DA55FA47633BD29A384E3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Hi Li,</p>
    <p>Thanks for having a look at my patch. To my knowledge <i>pthread_timedjoin_np</i>
      does not kill the thread if it times out. It returns ETIMEDOUT
      which, in this case, leads to the whole testcase terminating.</p>
    <p>I chose this method over setting test.timeout because this way an
      informative error-message can be printed.</p>
    <p>I may be missing the problem here. Can you point me in the right
      direction why this is bad practice?</p>
    <p>Kind regards,</p>
    <p>Christian<br>
    </p>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 07/05/2019 10:07, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2e=9J_7OtSsS5wq+4YgfOm1zj=PK5cnaBk69LKtdR71ZA@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div dir="ltr">
            <div dir="ltr">
              <div class="gmail_default" style="font-size:small">Hi Christian,</div>
            </div>
            <br>
            <div class="gmail_quote">
              <div dir="ltr" class="gmail_attr">On Tue, May 7, 2019 at
                2:56 PM Christian Amann &lt;<a
                  href="mailto:camann@suse.com" moz-do-not-send="true">camann@suse.com</a>&gt;
                wrote:<br>
              </div>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">On kernels &lt; 4.14
                (missing commit 2d97591ef43d) reading from<br>
                the request socket does not return and the testcase does
                not<br>
                finish.<br>
                <br>
                This fix moves the logic to a child thread in order for
                the<br>
                parent to handle the timeout and report a message to the
                user.<br>
                <br>
                Signed-off-by: Christian Amann &lt;<a
                  href="mailto:camann@suse.com" target="_blank"
                  moz-do-not-send="true">camann@suse.com</a>&gt;<br>
                ---<br>
                 testcases/kernel/crypto/Makefile   |  2 ++<br>
                 testcases/kernel/crypto/af_alg02.c | 36
                +++++++++++++++++++++++++++++++++++-<br>
                 2 files changed, 37 insertions(+), 1 deletion(-)<br>
                <br>
                diff --git a/testcases/kernel/crypto/Makefile
                b/testcases/kernel/crypto/Makefile<br>
                index 76f9308c2..6547e1cb6 100644<br>
                --- a/testcases/kernel/crypto/Makefile<br>
                +++ b/testcases/kernel/crypto/Makefile<br>
                @@ -20,3 +20,5 @@ include $(top_srcdir)/include/mk/<a
                  href="http://testcases.mk" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">testcases.mk</a><br>
                 CFLAGS                 += -D_GNU_SOURCE<br>
                <br>
                 include $(top_srcdir)/include/mk/<a
                  href="http://generic_leaf_target.mk" rel="noreferrer"
                  target="_blank" moz-do-not-send="true">generic_leaf_target.mk</a><br>
                +<br>
                +af_alg02: CFLAGS += -pthread<br>
                diff --git a/testcases/kernel/crypto/af_alg02.c
                b/testcases/kernel/crypto/af_alg02.c<br>
                index a9e820423..056511993 100644<br>
                --- a/testcases/kernel/crypto/af_alg02.c<br>
                +++ b/testcases/kernel/crypto/af_alg02.c<br>
                @@ -7,12 +7,23 @@<br>
                  * Regression test for commit ecaaab564978 ("crypto:
                salsa20 - fix<br>
                  * blkcipher_walk API usage"), or CVE-2017-17805.  This
                test verifies that an<br>
                  * empty message can be encrypted with Salsa20 without
                crashing the kernel.<br>
                + *<br>
                + * read() fix:<br>
                + * Calls read() in child thread in order to manually
                kill it after timeout.<br>
                + * With kernels missing commit 2d97591ef43d ("crypto:
                af_alg - consolidation<br>
                + * of duplicate code") read() does not return.<br>
                  */<br>
                <br>
                 #include "tst_test.h"<br>
                 #include "tst_af_alg.h"<br>
                +#include "tst_safe_pthread.h"<br>
                +#include &lt;pthread.h&gt;<br>
                +#include &lt;time.h&gt;<br>
                +#include &lt;errno.h&gt;<br>
                <br>
                -static void run(void)<br>
                +#define VERIFY_TIMEOUT (time(NULL) + 5)<br>
              </blockquote>
              <div><br>
              </div>
              <div class="gmail_default" style="font-size:small">It is
                very neccessary to take some action before process being
                killed in timeout. In LTP, we have an
                tst_timeout_remaining() function. Have a look?</div>
              <blockquote class="gmail_quote" style="margin:0px 0px 0px
                0.8ex;border-left:1px solid
                rgb(204,204,204);padding-left:1ex">
                +<br>
                +void *verify_encrypt(void *arg)<br>
                 {<br>
                        char buf[16];<br>
                        int reqfd = tst_alg_setup_reqfd("skcipher",
                "salsa20", NULL, 16);<br>
                @@ -22,6 +33,29 @@ static void run(void)<br>
                                tst_res(TPASS, "Successfully
                \"encrypted\" an empty message");<br>
                        else<br>
                                tst_res(TBROK, "read() didn't return
                0");<br>
                +       return arg;<br>
                +}<br>
                +<br>
                +static void run(void)<br>
                +{<br>
                +       pthread_t thr;<br>
                +       int join_ret;<br>
                +       struct timespec read_timeout;<br>
                +<br>
                +       read_timeout.tv_sec  = VERIFY_TIMEOUT;<br>
                +       read_timeout.tv_nsec = 0;<br>
                +<br>
                +       SAFE_PTHREAD_CREATE(&amp;thr, NULL,
                verify_encrypt, NULL);<br>
                +       join_ret = pthread_timedjoin_np(thr, NULL,
                &amp;read_timeout);<br>
                +<br>
                +       if (join_ret != 0) {<br>
                +               if (join_ret == ETIMEDOUT)<br>
                +                       tst_brk(TBROK,<br>
                +                               "Timed out while reading
                from request socket.");<br>
                +               else<br>
                +                       tst_brk(TBROK | TTERRNO,<br>
                +                               "Error while joining
                child thread");<br>
                +       }<br>
                 }<br>
                <br>
                 static struct tst_test test = {<br>
                -- <br>
                2.16.4<br>
                <br>
                <br>
                -- <br>
                Mailing list info: <a
                  href="https://lists.linux.it/listinfo/ltp"
                  rel="noreferrer" target="_blank"
                  moz-do-not-send="true">https://lists.linux.it/listinfo/ltp</a><br>
              </blockquote>
            </div>
            <br clear="all">
            <div><br>
            </div>
            -- <br>
            <div dir="ltr" class="gmail_signature">
              <div dir="ltr">
                <div>Regards,<br>
                </div>
                <div>Li Wang<br>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------F37DA55FA47633BD29A384E3--

--===============0226159435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============0226159435==--
