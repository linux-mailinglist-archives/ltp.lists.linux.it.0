Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F096E12D672
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 06:49:37 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9CA993C220D
	for <lists+linux-ltp@lfdr.de>; Tue, 31 Dec 2019 06:49:37 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 0DADD3C1CF5
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 06:49:35 +0100 (CET)
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 575FC60B78F
 for <ltp@lists.linux.it>; Tue, 31 Dec 2019 06:49:32 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.69,378,1571673600"; d="scan'208,217";a="81046231"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
 by heian.cn.fujitsu.com with ESMTP; 31 Dec 2019 13:49:29 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
 by cn.fujitsu.com (Postfix) with ESMTP id 5F4DC4CE1C9A;
 Tue, 31 Dec 2019 13:40:36 +0800 (CST)
Received: from [10.167.220.84] (10.167.220.84) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1395.4; Tue, 31 Dec 2019 13:49:26 +0800
To: Li Wang <liwang@redhat.com>
References: <20191218082826.25083-1-liwang@redhat.com>
 <2104821569.17247635.1576661091375.JavaMail.zimbra@redhat.com>
 <CAFA6WYN1ssqCzCqvT=9=DLjZdQz8OnH7+YBi8VGo7XLRdNLyvg@mail.gmail.com>
 <CAEemH2eRhmozt5OiT6z-YBjJUBNaGZgQVQRh40hNpKcq2d4-aw@mail.gmail.com>
 <CAFA6WYOBbH8UbwrK1f3ZQjGuqHJqGZxhQ-N0w1mpBHz0bnPG1w@mail.gmail.com>
 <CAEemH2eXvZB9uCuZFsc2uMAt5k2F_gfgXCqch58juMsJn4Gr4w@mail.gmail.com>
 <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
From: Yang Xu <xuyang2018.jy@cn.fujitsu.com>
Message-ID: <23f8d05b-efff-56ba-b5d8-f99046e5619c@cn.fujitsu.com>
Date: Tue, 31 Dec 2019 13:49:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.0
MIME-Version: 1.0
In-Reply-To: <CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com>
X-Originating-IP: [10.167.220.84]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: 5F4DC4CE1C9A.A262D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xuyang2018.jy@cn.fujitsu.com
X-Spam-Status: No, score=0.4 required=7.0 tests=HTML_MESSAGE, KHOP_HELO_FCRDNS,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH RFC] sync_file_range02: remove the toplimit of
 write back
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Caspar Zhang <caspar@linux.alibaba.com>, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0825133752=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0825133752==
Content-Type: multipart/alternative;
	boundary="------------0F824C99E039DE4A0910AF96"

--------------0F824C99E039DE4A0910AF96
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Li

on 2019/12/31 13:25, Li Wang wrote:
> Hi,
>
> On Thu, Dec 19, 2019 at 5:15 PM Li Wang <liwang@redhat.com 
> <mailto:liwang@redhat.com>> wrote:
>
>
>
>     On Thu, Dec 19, 2019 at 4:52 PM Sumit Garg <sumit.garg@linaro.org
>     <mailto:sumit.garg@linaro.org>> wrote:
>
>         ...
>         >> To avoid similar scenarios, I suggested to add a "sync()"
>         call just
>         >> prior to test here [1]. And I couldn't reproduce the failure in
>         >> 1000-times run with 4.19 kernel.
>         >
>         >
>         > Yes, that makes sense to me.
>         >
>
>         Would you mind to give it a try and check if you could
>         reproduce the failure?
>
>
>     Actually, I haven't had one time to reproduce it. This failure was
>     reported by CI jobs and very low frequency occurred. The fix is
>     based on a discussion with FS developer analysis.
>
>     But I would have a try with this patch(+ sync()).
>
>
> I have tried this for many different systems, and it doesn't hit the 
> failure at least one time. So if no more comments, I would merge the 
> patch as below in the next step.

I have a question.we must call sync()? I think syncfs is more accurate.

Best Regards
Yang Xu

>
> --- a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> +++ b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c
> @@ -48,6 +48,8 @@ static void verify_sync_file_range(struct testcase *tc)
>
>         lseek(fd, tc->write_off, SEEK_SET);
>
> +       sync();
> +
>         tst_dev_bytes_written(tst_device->dev);
>
>         tst_fill_fd(fd, 0, TST_MB, tc->write_size_mb);
> @@ -66,8 +68,7 @@ static void verify_sync_file_range(struct testcase *tc)
>
>         SAFE_CLOSE(fd);
>
> -       if ((written >= tc->exp_sync_size) &&
> -           (written <= (tc->exp_sync_size + tc->exp_sync_size/10)))
> +       if (written >= tc->exp_sync_size)
>                 tst_res(TPASS, "%s", tc->desc);
>         else
>                 tst_res(TFAIL, "%s: Synced %li, expected %li", tc->desc,
>
> -- 
> Regards,
> Li Wang
>



--------------0F824C99E039DE4A0910AF96
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Li<br>
    </p>
    <div class="moz-cite-prefix">on 2019/12/31 13:25, Li Wang wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small">Hi,</div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Thu, Dec 19, 2019 at 5:15
            PM Li Wang &lt;<a href="mailto:liwang@redhat.com"
              target="_blank" moz-do-not-send="true">liwang@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            <div dir="ltr">
              <div dir="ltr">
                <div style="font-size:small"><br>
                </div>
              </div>
              <br>
              <div class="gmail_quote">
                <div dir="ltr" class="gmail_attr">On Thu, Dec 19, 2019
                  at 4:52 PM Sumit Garg &lt;<a
                    href="mailto:sumit.garg@linaro.org" target="_blank"
                    moz-do-not-send="true">sumit.garg@linaro.org</a>&gt;
                  wrote:<span class="gmail_default"
                    style="font-size:small"></span></div>
                <blockquote class="gmail_quote" style="margin:0px 0px
                  0px 0.8ex;border-left:1px solid
                  rgb(204,204,204);padding-left:1ex"><span
                    class="gmail_default" style="font-size:small">...</span><br>
                  &gt;&gt; To avoid similar scenarios, I suggested to
                  add a "sync()" call just<br>
                  &gt;&gt; prior to test here [1]. And I couldn't
                  reproduce the failure in<br>
                  &gt;&gt; 1000-times run with 4.19 kernel.<br>
                  &gt;<br>
                  &gt;<br>
                  &gt; Yes, that makes sense to me.<br>
                  &gt;<br>
                  <br>
                  Would you mind to give it a try and check if you could
                  reproduce the failure?<br>
                </blockquote>
                <div><br>
                </div>
                <div>
                  <div style="font-size:small">Actually, I haven't had
                    one time to reproduce it. This failure was reported
                    by CI jobs and very low frequency occurred. The fix
                    is based on a discussion with FS developer analysis.</div>
                  <div style="font-size:small"><br>
                  </div>
                  <div style="font-size:small">But I would have a try
                    with this patch(+ sync()).</div>
                </div>
              </div>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">I have
              tried this for many different systems, and it doesn't hit
              the failure at least one time. So if no more comments, I
              would merge the patch as below in the next step.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <pre>I have a question.we must call sync()? I think syncfs is more accurate.

Best Regards
Yang Xu
</pre>
    <blockquote type="cite"
cite="mid:CAEemH2coGZGjFLhHzeR4JJYWpERGypjRdXRQ2dO0f1=Drh2KOg@mail.gmail.com">
      <div dir="ltr">
        <div class="gmail_quote">
          <div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
          </div>
          <div class="gmail_default" style="font-size:small">---
            a/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>
            +++
            b/testcases/kernel/syscalls/sync_file_range/sync_file_range02.c<br>
            @@ -48,6 +48,8 @@ static void verify_sync_file_range(struct
            testcase *tc)<br>
             <br>
                    lseek(fd, tc-&gt;write_off, SEEK_SET);<br>
             <br>
            +       sync();<br>
            +<br>
                    tst_dev_bytes_written(tst_device-&gt;dev);<br>
             <br>
                    tst_fill_fd(fd, 0, TST_MB, tc-&gt;write_size_mb);<br>
            @@ -66,8 +68,7 @@ static void verify_sync_file_range(struct
            testcase *tc)<br>
             <br>
                    SAFE_CLOSE(fd);<br>
             <br>
            -       if ((written &gt;= tc-&gt;exp_sync_size) &amp;&amp;<br>
            -           (written &lt;= (tc-&gt;exp_sync_size +
            tc-&gt;exp_sync_size/10)))<br>
            +       if (written &gt;= tc-&gt;exp_sync_size)<br>
                            tst_res(TPASS, "%s", tc-&gt;desc);<br>
                    else<br>
                            tst_res(TFAIL, "%s: Synced %li, expected
            %li", tc-&gt;desc,<br>
          </div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        -- <br>
        <div dir="ltr">
          <div dir="ltr">
            <div>Regards,<br>
            </div>
            <div>Li Wang<br>
            </div>
          </div>
        </div>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------0F824C99E039DE4A0910AF96--

--===============0825133752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0825133752==--
