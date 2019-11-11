Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A7801F6BF3
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 01:34:49 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 244E93C2268
	for <lists+linux-ltp@lfdr.de>; Mon, 11 Nov 2019 01:34:49 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 9E55A3C0823
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 01:34:43 +0100 (CET)
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 91D8014016AD
 for <ltp@lists.linux.it>; Mon, 11 Nov 2019 01:34:42 +0100 (CET)
Received: by mail-qt1-x841.google.com with SMTP id p20so13870426qtq.5
 for <ltp@lists.linux.it>; Sun, 10 Nov 2019 16:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3foiZ2FJUPwp/n84MCyzCQP49K8HSRu7uAaKO9JiHiI=;
 b=e3bEGQjYntjNcRJQJLt700CnAhov2q3LMHXmurwSbXjzmM7J0IpqpFact5e9gcEV11
 0foNj62wZ3JJcfenSov9snBgUk7zY5wBqFMlHixxR8uFaJsJkhA9qkbxm/zIvrS5vZ+U
 jAt9XwXMJvG1hC12TOhlgwonIL+igdO0Ts3vXCkBFQU/YOJ0B1re6PXVKTP4fKnmzika
 d8GSr9yg6yQRrf5zKTrbvwrz9uFlJa+UCnjIb+lhl18btj5dk5y91flGRXdrsDelmC9z
 5GtBbRJSvPgZ/sfRmA3NPKByHolmpPA89mBkVVH68S96jMW3PGoNV0FpDF3w0xfG8tP+
 Gt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3foiZ2FJUPwp/n84MCyzCQP49K8HSRu7uAaKO9JiHiI=;
 b=SngLFKdxHzTORSnykazAptoWZlUq7YW1v8st2yxhpzwV69LY+sICopHCMBKDHVYeQP
 scszETFBd8dO5lfHRDOpwmZamMqFFlv2crxx2Au9FA+nMHTtJAT/wJE+sdJBX/JL4vv7
 MzBht9WW18uSHKHTL4p12RraVoukGdpIuJUDi70AxQaXNqgLM8ljm1V21KFwQjtYeFmn
 03FyVL1H6HYmBUMDekJP/xZSt1jS5GZ1qGwmHpqLi8ZdyFU1AD/kFjS8F47dRfH0vO9I
 vuCTNw7SdxXVyQ+Q+kLtr4LvU2BiPNAisgcqtB0wqEvTrzcG66VXTc3XHmHeLBcDPGLU
 Pt2g==
X-Gm-Message-State: APjAAAWISuEIhCFfcsTykSyuU6LvGBOXt3Jak7dQYJ8LtWJXTG7/22CH
 LAqIQq3524fSES7enigeGDqd0knAtyM0G6RBLCZz5OxRcDlTMQ==
X-Google-Smtp-Source: APXvYqyttDwBOStzNnpWDhvBtBap1Pt6MXUxB9mBl9KqVTlZITs8j5W6X2DoXtjEKK3Jqgn8x/QA/SHjDBvBr6S7MBc=
X-Received: by 2002:ac8:3679:: with SMTP id n54mr23683519qtb.25.1573432480997; 
 Sun, 10 Nov 2019 16:34:40 -0800 (PST)
MIME-Version: 1.0
From: Yu <999iscool@gmail.com>
Date: Sun, 10 Nov 2019 19:34:30 -0500
Message-ID: <CALgnY2eHDnkoYLoC5TdFzecjpUb2AAJRadU30LofZxT2QG-fgg@mail.gmail.com>
To: ltp@lists.linux.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.7 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, FROM_STARTS_WITH_NUMS, HTML_MESSAGE,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: [LTP] Verify LTP was compiled with specific kernel headers
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
Content-Type: multipart/mixed; boundary="===============1810190889=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1810190889==
Content-Type: multipart/alternative; boundary="0000000000001ba5870597074ceb"

--0000000000001ba5870597074ceb
Content-Type: text/plain; charset="UTF-8"

Hi

Not sure if this is the right place to ask, but I am trying to compile LTP
with a specific kernel release. The source tarball was extracted. I make
install the linux kernel headers:

make headers_install INSTALL_HDR_PATH=/tmp/test-kernel-h

Then I proceeded with:

make autotool
./configure --prefix=/tmp/out --includedir=/tmp/kernel-h/include/linux
make
make install

My question is how can I tell if it's really compiled with those headers?
Is includedir the right one to use? I see oldincludedir is defaults to
/usr/include.

ver_linux script looks at /etc/*release file.

Thanks

YW

--0000000000001ba5870597074ceb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<div><br></div><div>Not sure if this is the right place =
to ask, but I am trying to compile LTP with a specific kernel release. The =
source tarball was extracted. I make install the linux kernel headers:</div=
><div><br></div><div>make headers_install INSTALL_HDR_PATH=3D/tmp/test-kern=
el-h<br></div><div><br></div><div>Then I proceeded with:</div><div><br></di=
v><div><div>make autotool</div><div>./configure --prefix=3D/tmp/out --inclu=
dedir=3D/tmp/kernel-h/include/linux</div><div>make</div><div>make install</=
div></div><div><br></div><div>My question is how can I tell if it&#39;s rea=
lly compiled with those headers? Is includedir the right one to use? I see =
oldincludedir is defaults to /usr/include.</div><div><br></div><div>ver_lin=
ux script looks at /etc/*release file.</div><div><br></div><div>Thanks</div=
><div><br></div><div>YW</div><div><br></div></div>

--0000000000001ba5870597074ceb--

--===============1810190889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1810190889==--
