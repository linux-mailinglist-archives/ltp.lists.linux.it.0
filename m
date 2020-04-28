Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5D1BC2D2
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 17:19:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 101D63C2856
	for <lists+linux-ltp@lfdr.de>; Tue, 28 Apr 2020 17:19:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 8CD2D3C226C
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 17:19:02 +0200 (CEST)
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 12E6F600542
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 17:18:55 +0200 (CEST)
Received: by mail-io1-xd42.google.com with SMTP id y26so13375094ioj.2
 for <ltp@lists.linux.it>; Tue, 28 Apr 2020 08:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TQFroG4YCNQO5fUJ94mZgA0WXchogNEeMwVSQVTy44w=;
 b=ZTjpFolTXZDNvJPLvEZY10OGpbhdjrhp52CANv5/rA+RNRlm/q7wxy8MTk4/mcwGOU
 0S1ruCxxEq6lULbLPT05pnDKxWkGmhnlRnVydztdK2xJcjYejhIYZ5bIaDcYnTRy7DH/
 7dqDzZR1eJIkw5nAziyOaxBypR49mjjOMXyVpLyzSaX780myN1786RemJNOkhM8bJnZf
 3zdoM3M6xeiRvwadF0QriXE+/rnzBu2bYLSVFyDibBKzTk2fIlz2EdQFC3StLXsNrE2R
 7hHwpOOP8Y/emKmbnyIU5yrWycDYLLGig1xUSRQkPJHNESfA0MNSLdnx0Ueuofh5pF0B
 pXxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TQFroG4YCNQO5fUJ94mZgA0WXchogNEeMwVSQVTy44w=;
 b=Sgl+XAlsCT4nVMbm7atL9exozYZAW3gYaR22MyiW9xXMpAC8DLE/4UUpraqPT72o+/
 ZLEGGvp889cL+tF9z7Bd0cEqN9EZhtujYislHf9jeYaZei6okjKPpJwlePksdmeuyIJP
 Q73jU8rlrpfkzhjPdtSY6AaDSea6E2SaYXCvhcgQGCIoHmAduYXlsqtxcwe7u0aCrCv2
 LieFT3ZYqAw+bQAHhDLiWW6dQIz8BmDY1vfBUhrYfgbOQHCgpfBMTkxsSDsV69msfWEq
 3zMJPoeojq8qTQhbQLEKPL2br9ZVgpW1PBe/KaAP8hmMS5vrNe2MO15joCD/AZZNm8fr
 Cu/w==
X-Gm-Message-State: AGi0Pubyn5htg8W4DWGqOKEl0oSfjqAmDFRKQcM1mrT2j3W6MAibDILi
 a6nRjZrEYXgD7prGM6KOaQSBHbLkDTP+nKjxX80ICIek
X-Google-Smtp-Source: APiQypIIz7AU3L4uJ/KzAcHp3+j6ewUfbjg7IFZ0xTmHz3htcXOZKz9XAdoAWdTLxY1psTVhQbbf7z54PQh1BbE4STA=
X-Received: by 2002:a6b:7317:: with SMTP id e23mr26348181ioh.72.1588087140094; 
 Tue, 28 Apr 2020 08:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200428113501.24711-1-pvorel@suse.cz>
 <20200428113501.24711-2-pvorel@suse.cz>
 <CAOQ4uxjTh5r3JWVzt6Gazh61Cb1Fr7Y90k1mXn=q2WbsSRs2NQ@mail.gmail.com>
 <20200428133748.GA5349@dell5510>
In-Reply-To: <20200428133748.GA5349@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 28 Apr 2020 18:18:48 +0300
Message-ID: <CAOQ4uxjJ7qFZVf4YNNK=JYDSc=_+fRoU6v+OAwQ3Vp7soNSAbQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
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

On Tue, Apr 28, 2020 at 4:37 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > FWIW, I have no objection to these changes.
> Thanks!
>
> > I trust that you tested build with all supported configurations, because
> > I am not good at reviewing portable code.
> Not sure if I understand you. There is just a single configuration (test are run
> twice, first with raw syscall than with libc wrapper). Previously there were two
> configurations (tests were run only once, mostly with libc wrapper, raw syscalls
> was on systems with old glibc, where only kernel supports fanotify syscall).
>

My confusion is because you removed the HAVE_SYS_FANOTIFY_H ifdef
and now you include sys/fanotify.h unconditionally.
So I meant if this code builds with all supported system configurations.

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
