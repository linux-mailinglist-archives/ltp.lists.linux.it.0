Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2882C6699
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 14:20:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BEE6B3C56CA
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Nov 2020 14:20:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id AFA703C4E06
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 14:20:33 +0100 (CET)
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 5B09D1A0153A
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 14:20:33 +0100 (CET)
Received: by mail-io1-xd44.google.com with SMTP id z5so4762437iob.11
 for <ltp@lists.linux.it>; Fri, 27 Nov 2020 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0SXF9ilRfl7pP0853k68I6I7/QhyEMuwoHthH/M0/pU=;
 b=cIGjTLcVIjOJDZ7ULCCRbp8V3S9IoyYMMP7JVNdGG8leeAJd544Ba7aCiyF3gvFpxz
 xdTHjvtcObIklYjiPfHuK+3DPWPg4K+RHY+lwIIV47PssU/rhM6ifesitcfnBVqxxOun
 RmE8PX4lNpzF9SIi5q3jwfDwoDvyMrfhbJjjos3uuD2OBFDnIfXrbghjbCrZRA3i+kpW
 GCweNj1DzW0geK0TI7Yqc1ySCARBCaQSlamyo8dZHiumLJ1CN+wzzoZe+zaXYi/FNzEO
 sQnwg9zKAPaW/adcbhTamBIMxjgpS4bmXbblWjAMMXoIXZHn0TArqlOfzGSp+IED0Ir3
 sRbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0SXF9ilRfl7pP0853k68I6I7/QhyEMuwoHthH/M0/pU=;
 b=ihIzo6icwWDzOE7XeXhnwakpm6pQF97HfdNVgIe+mRvODykFSYzzDDC9HuYPwdciTK
 QYbxHsWwj9uMMvf+ao2whFI7h9P43yTkkJF6ow3qUnGeAme9o0w5UNME/YqOGvSEXK9n
 KM0TVbtqDR1eHhpz1NKJLfwKglCiJWkmcLVsHmB1r/+bZSk2bNFo1GUU6gEdNavhm8g2
 52L7vgFS+Ed5qpH6QAYZFfBR17rYT2UpxsMh1I4bdc6u+V/YuUC2dl5kA5xCPJ84oTgC
 i1YwfDMCqZao7ERmiLEqk8DYy0PbDKuZbRsvuImzIj46SE3SYRydpADo+1EWftzY655d
 zg3g==
X-Gm-Message-State: AOAM5330PScf860np+LDm8i0hFxifw0FyvUzi6JtQ7Zd1uG3ZY+T89pT
 G2tFIxnXx25D1nneU5SY4J3z5n2DAt7yQN1LMMg=
X-Google-Smtp-Source: ABdhPJynWzLstKBYPWuMisjc0lGKUeguBJOn/F252X8ctZMCcPTNxt2hw4ZGv1yN28fVs49T+M7WAjBsOQNZ26X6SJw=
X-Received: by 2002:a02:ccd6:: with SMTP id k22mr7431993jaq.93.1606483232057; 
 Fri, 27 Nov 2020 05:20:32 -0800 (PST)
MIME-Version: 1.0
References: <20201126214121.6836-1-pvorel@suse.cz>
 <20201126214121.6836-3-pvorel@suse.cz>
In-Reply-To: <20201126214121.6836-3-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 27 Nov 2020 15:20:21 +0200
Message-ID: <CAOQ4uxhpMvwsOKRPVegkTWxOi2MqQNABtfQ7DyZQ1Z01nE5Cng@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 2/6] fanotify: Handle supported features checks
 in setup()
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Thu, Nov 26, 2020 at 11:41 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Create 2 helpers which are used in various tests in setup() to check for
> FAN_ACCESS_PERM enablement (caused by disabled CONFIG_FANOTIFY_ACCESS_PERMISSIONS)
> or FAN_OPEN_EXEC and FAN_OPEN_EXEC_PERM support in kernel.
>
> That helps to further code simplification in next commit.
>
> Due this change test with FAN_OPEN_EXEC_PERM in fanotify03.c no longer
> needs to be a first test.
>
> Also rename variable s/support_exec_events/exec_events_unsupported/
> for readability.
>
> Suggested-by: Amir Goldstein <amir73il@gmail.com>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---

You may add:
Reviewed-by: Amir Goldstein <amir73il@gmail.com>

Just one nit I wrote it in review and you must have missed it.
There is nothing related to "exec" in the helper.
It should be called fanotify_events_supported_by_kernel().

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
