Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8311F3327
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 06:39:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E57453C2E45
	for <lists+linux-ltp@lfdr.de>; Tue,  9 Jun 2020 06:39:17 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id ABFA43C12D0
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 06:39:13 +0200 (CEST)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 5D6002005F1
 for <ltp@lists.linux.it>; Tue,  9 Jun 2020 06:39:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CDE5B1FB;
 Mon,  8 Jun 2020 21:39:10 -0700 (PDT)
Received: from [10.163.78.226] (unknown [10.163.78.226])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 677DE3F66F;
 Mon,  8 Jun 2020 21:39:09 -0700 (PDT)
From: Vikas Kumar <vikas.kumar2@arm.com>
To: ltp@lists.linux.it
References: <20200601053550.3848-1-vikas.kumar2@arm.com>
Message-ID: <14e7e598-b0aa-5c62-3cb3-726d29e315da@arm.com>
Date: Tue, 9 Jun 2020 10:09:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200601053550.3848-1-vikas.kumar2@arm.com>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V6] syscall: Add io_uring related tests
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
Cc: viresh.kumar@linaro.org
Content-Type: multipart/mixed; boundary="===============0579475706=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a multi-part message in MIME format.
--===============0579475706==
Content-Type: multipart/alternative;
 boundary="------------D1AA91E1E370B123803C1287"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------D1AA91E1E370B123803C1287
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/20 11:05 am, Vikas Kumar wrote:
> Added asynchronous I/O API tests for io_uring_setup(), io_uring_register()
> and io_uring_enter(). These tests intend to validate io_uring operations.
>
> 1. io_uring_setup() creates submission queue and completion queue to
>     perform subsequent operations on the io_uring instance.
> 2. io_uring_register() registers user buffers in kernel for long term
>     usese.
> 3. io_uring_enter() initiates I/O operations using the shared SQ and CQ
>     queue.
>
> Signed-off-by: Vikas Kumar<vikas.kumar2@arm.com>

Gentle reminder. Any updates on this patch ?

- Vikas




--------------D1AA91E1E370B123803C1287
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 01/06/20 11:05 am, Vikas Kumar
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200601053550.3848-1-vikas.kumar2@arm.com">
      <pre class="moz-quote-pre" wrap="">Added asynchronous I/O API tests for io_uring_setup(), io_uring_register()
and io_uring_enter(). These tests intend to validate io_uring operations.

1. io_uring_setup() creates submission queue and completion queue to
   perform subsequent operations on the io_uring instance.
2. io_uring_register() registers user buffers in kernel for long term
   usese.
3. io_uring_enter() initiates I/O operations using the shared SQ and CQ
   queue.

Signed-off-by: Vikas Kumar <a class="moz-txt-link-rfc2396E" href="mailto:vikas.kumar2@arm.com" moz-do-not-send="true">&lt;vikas.kumar2@arm.com&gt;</a></pre>
    </blockquote>
    <p>Gentle reminder. Any updates on this patch ?</p>
    <p>- Vikas<br>
    </p>
    <p><span style="color: rgb(209, 210, 211); font-family: Slack-Lato,
        appleLogo, sans-serif; font-size: 15px; font-style: normal;
        font-variant-ligatures: common-ligatures; font-variant-caps:
        normal; font-weight: 400; letter-spacing: normal; orphans: 2;
        text-align: left; text-indent: 0px; text-transform: none;
        white-space: normal; widows: 2; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(34, 37,
        41); text-decoration-style: initial; text-decoration-color:
        initial; display: inline !important; float: none;"><br>
      </span></p>
    <p><br>
    </p>
  </body>
</html>

--------------D1AA91E1E370B123803C1287--

--===============0579475706==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0579475706==--
