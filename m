Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EB024C9E9
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 04:14:28 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 35A0A3C2FCF
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Aug 2020 04:14:28 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id 5F01F3C13D8
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 04:14:26 +0200 (CEST)
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 1535A1000618
 for <ltp@lists.linux.it>; Fri, 21 Aug 2020 04:14:26 +0200 (CEST)
Received: by mail-pf1-x441.google.com with SMTP id d188so320471pfd.2
 for <ltp@lists.linux.it>; Thu, 20 Aug 2020 19:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ML4nNoRZh539tOvX4DSI85rDnn4ZMd+BmT+EK5FHbCQ=;
 b=JB8cWQpVext3+G/JXJSxlmWCfngHhrB6wDHFfq/TCMst7XmiCwIcC1LAi4j8MsJaDH
 3AtWiQltRoza3s+woZ9IkM7wPqq/8kOXgfeLrTkO6f/TXrqAdhKy0HpQ6ab0sHa9D/li
 QVU8ub7ctygVxtNBZs1ICvMqJbtKLulGVR8Rck6LjB7sAM5MbK+vLVDijZLy20gHZUOP
 F13U1qIWu+jTGD0l726gwCA3YK8+tWS0K6kdiZXC9usAN8Dk5IL+xMFI/6McZfPlpNUc
 +xgo40Y6c2mTgKNd/e92+yGeAZ02Gd4PlqPjHq1Afl0wIjfUXxPu27+jA5zd8EB9Hp/K
 NszQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ML4nNoRZh539tOvX4DSI85rDnn4ZMd+BmT+EK5FHbCQ=;
 b=nMPJXv//RBxQasPCHrGz5sKmqah4vYH4FSINe51joHEbSyZdj7ymB/p3Te45kSZ1x3
 Y2y1OWQlbTftHV8ge1O5sEH9oFr3gX5b7B03wG1bzXmsxCkRGs7FnOP8O+Tzhc46r8ku
 pHxFxxREAqfUBJWQBxRfh7dE4rn0XCp+Sp80poyhOJT6YUY8pLJIqGxz0B/P43K3JWy+
 0hRbPhMPZ1q0AHM3D/7KDeU/9Na11wtANS4d1BDdYCd0pULrGOCeU+wBMkXyfKLXKzpL
 OSoKPid6gmh5qB5Ohwqa9cUetAzFZuJkOjP2J4ZCkd4F2qVSrfRT038kSwmkHlaPhHDb
 zzrg==
X-Gm-Message-State: AOAM533AAI1xvVWeXiO4hqRDfcyFeR5VtyaGsBwuQtdauLH+cS1AACyP
 M+4bA4fRJkszr6l96XJ/LFM=
X-Google-Smtp-Source: ABdhPJzc+HwqBQ13+A8x0/SA7+siIqEtnsw0IWRjuYBkC98zW2azf7ZhPNq6ImVnhXXWEEb0+BuXBQ==
X-Received: by 2002:a63:1748:: with SMTP id 8mr726341pgx.207.1597976064260;
 Thu, 20 Aug 2020 19:14:24 -0700 (PDT)
Received: from localhost ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id b22sm402939pfb.213.2020.08.20.19.14.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 19:14:23 -0700 (PDT)
Date: Fri, 21 Aug 2020 10:14:16 +0800
From: Murphy Zhou <jencce.kernel@gmail.com>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200821021416.4jkqe2e57d42xkmx@xzhoux.usersys.redhat.com>
References: <20200820015211.u7xdye5ggbe34fsp@xzhoux.usersys.redhat.com>
 <CAEemH2faf5g0JUdBFNvqrNRHB5orbTvHnrwHCm5enF7tt7N=YA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2faf5g0JUdBFNvqrNRHB5orbTvHnrwHCm5enF7tt7N=YA@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setxattr03: TCONF if failed to set immutable flag
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

Hi Li,

On Thu, Aug 20, 2020 at 02:16:07PM +0800, Li Wang wrote:
> Hi Murphy,
> 
> On Thu, Aug 20, 2020 at 9:52 AM Murphy Zhou <jencce.kernel@gmail.com> wrote:
> 
> > Instead of TBROK, probably the underlying filesystem not support this flag.
> >
> 
> Which filesystem do you mean here? What kind of error it was given?
> Maybe we should confirm the errno is EINVAL or ENOTSUP before TCONF.

NFS, with latest upstream kernel.

Like:

tst_test.c:1247: INFO: Timeout per run is 0h 15m 00s
setxattr03.c:142: BROK: Set setxattr03immutable immutable failed: ENOTTY (25)
setxattr03.c:154: WARN: Unset setxattr03immutable immutable failed: ENOTTY (25)

The reason not checking errno is that `chattr +i` is a very basic operation,
if it fails, most probably it's not supported. NFS returning ENOTTY
makes checking errno more tricky. So I did not check it and made it as
simple as the checking in xfstests.

Thanks very much for reviewing!

> 
> -- 
> Regards,
> Li Wang

-- 
Murphy

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
