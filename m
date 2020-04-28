Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A580F1BBF72
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 15:27:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5291B3C2854
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 15:27:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 93F523C2832
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 15:26:56 +0200 (CEST)
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 9A74A1000D94
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 15:26:55 +0200 (CEST)
Received: by mail-io1-xd43.google.com with SMTP id i19so22737224ioh.12
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 06:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=im9Mj16bVNVCtZswxnxpRSzrw8eiiJnGdCR/quyOv5E=;
 b=kxECvpn3wZAi2fdL+dnF3NNCdl93nO2usGUWXkkhKsdwCJn+WTMd+325LMnrAP2Ikz
 iavGB7X4EQcDpAis6OV0t8x91Gpf9JvvKuYjGFBT91TAw//pNpU/8/HjpHSMofcwvAFw
 V1YLd8/qclvy0AGve9UuZpMb6VKQhUjmKyavbQpGSar4ZAfrYaFd6G4bFRqTxDS+h0up
 ttoDrN+Obzp077HkZCMRNuyCFDm6xSLGiC1/aqH8TKDLILE/777qWVA4Fft5UkOMrw8z
 3tlP9k7llLOtUzWnnp97rBWJzqhwW/7Y64d0fMJBs50CxUhznIY0klKvXbaoOnlSqRBK
 FZXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=im9Mj16bVNVCtZswxnxpRSzrw8eiiJnGdCR/quyOv5E=;
 b=NNoMoA7mHFIcy92VbLdEOLA7JFaz477BIlW0+aoUYEM6cAOJAvSCPvBnM0Kd5sfhAM
 T/EplMCjIZfui6XFvCEJ1WRZrVyn5qR2F5My3lGtC0rxwAvX6pldLMADeoVPsH3rAH+u
 Z+Oqi7U/fdcM/H1iX0elhY9CYknUwBmKyMOlvwt0wTFSBjxok6UX+aIm5FWxGmKy11tK
 MKLrrEUAYL1pky/hcJi9B29zWuwA8Rv0dbr8HACFhfFAlqtkOsSRbqVyLYKAgfdPinS6
 tcumAhf/7k6dV1vyAyhN8uY8mLvAGS3JmprwehUcxwskxFHETJh4rLHl9B/Naxa9lG4T
 ZF3Q==
X-Gm-Message-State: AGi0PuaLnzQjrOHqC0sZp0rNzsMyDhTjrz+HxxxILcT6y1gnI2DPP93P
 EJHM2RD+cbxG1SUvZNzonjTpSIerp9Q8SGalLcjl+A==
X-Google-Smtp-Source: APiQypKjFwHBWAy8JhuUhhnF5TMVlOmIvdMnsV+vM02IK4MfsAeftC2BXbEm+HH2/QrAYyvuYvma0cDGSAoz94eyAr0=
X-Received: by 2002:a6b:7317:: with SMTP id e23mr25811820ioh.72.1588080414524; 
 Tue, 28 Apr 2020 06:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200428113501.24711-1-pvorel@suse.cz>
 <20200428113501.24711-2-pvorel@suse.cz>
In-Reply-To: <20200428113501.24711-2-pvorel@suse.cz>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 28 Apr 2020 16:26:43 +0300
Message-ID: <CAOQ4uxjTh5r3JWVzt6Gazh61Cb1Fr7Y90k1mXn=q2WbsSRs2NQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] fanotify: Test with tst_variant both raw
 syscall and libc
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
Cc: Matthew Bobrowski <mbobrowski@mbobrowski.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Apr 28, 2020 at 2:35 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---
> Hi,
>
> patchset is based on Amir's patchset [1], which I'd prefer to have
> merged before.
>
> libc wrappers for fanotify_init() and fanotify_mark() are trivial, so it
> might not make sense to test both variants. WDYT?
>
> Kind regards,
> Petr
>
> [1] https://patchwork.ozlabs.org/project/ltp/list/?series=171631&state=*

FWIW, I have no objection to these changes.

I trust that you tested build with all supported configurations, because
I am not good at reviewing portable code.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
