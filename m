Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CC605341ED8
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:54:18 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 751AD3C5FC6
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Mar 2021 14:54:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 3BE843C2C33
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:54:16 +0100 (CET)
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 00274600F17
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 14:54:15 +0100 (CET)
Received: by mail-io1-xd2a.google.com with SMTP id j26so6153984iog.13
 for <ltp@lists.linux.it>; Fri, 19 Mar 2021 06:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HaUSBCDq5v0Q3EYLqQOlY6TsU5uDFI8j+mD4ZcH3Piw=;
 b=IJ8BDdO+xiddpncJH+92ZHX0ea2cDFbj84aqW2HS7STa0DYfb7pK1nLtkdKgz7+JAR
 yMWuvxlvfLSi/cr50U/M2GXmte8Uw9At/Ejq48HHCRn+dQJFV5OlKifNrpHQ56sz7h7O
 ddgczZ/BwfB9bpdgsLDd3f/W8bpoYth7OXVDMzYTEZCGwOMwU9/AoR8qWRQcsGm44V86
 iw+4Uo0a+wgejJQ78AISbgh8K+SxPv5nNI/30TjOcB37n+y3p8KhD+e4jjz0036i4m6F
 Cl22OYmxkwm5KOsFO74bNYlT1k9LRgTdXqTdaWCGBm2o5Ho8S5V08TEV5l6xCvzNy+st
 kb7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HaUSBCDq5v0Q3EYLqQOlY6TsU5uDFI8j+mD4ZcH3Piw=;
 b=e08MwENc9ziQE2hzKhjQLpM803GLBEwJSJxtnp9eyyZhij31JH4ZSyWu4PoWw3zuoU
 iImMyn6TJsPNVjCZ06WE7i0Kj5+bNOYSiFTG+YmuoNhdLn6QmKcXYxsu6cXNVrC0+RA3
 A248KjMNpNkO8fdjDXVxR2ys9PuWN6DKbMgIMbFYm45V5rugniitADlQIxmrnkdcndun
 GbZ6fhu3JCYyZg81pWUAtgNH4jq4pxdL+rhNc6EA9ahvATHQU7Ru+LRdzOA4PAi1O1mr
 Ghdti1xtz1ZyUY1dmllrRiogyFDZRU6634tk9t74DkE97N81W765B9jY6z8JO+Nepm2g
 ytaQ==
X-Gm-Message-State: AOAM530NddkKxT7LqGrqjzMvy+j/drddDzR5FS4t0OSlR8c4iPoxQaBt
 frlK6pfO63feNT+ajfM5/grKzYw/w9I/O/Rlga0=
X-Google-Smtp-Source: ABdhPJwMj6GV0E6ibMDLoLS4MAq5qyIn5c3FnFtfn3bn6Jd0cfm7OYX38cexHM4ts0lkhBVdU7XJ5ls9HFE+iV9cY9g=
X-Received: by 2002:a5d:9f4a:: with SMTP id u10mr2851143iot.186.1616162053735; 
 Fri, 19 Mar 2021 06:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210318131134.3562203-1-amir73il@gmail.com>
 <YFShR2Qd7Ubve1wi@pevik>
In-Reply-To: <YFShR2Qd7Ubve1wi@pevik>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 19 Mar 2021 15:54:02 +0200
Message-ID: <CAOQ4uxhLOqfarhXa-mnPnUtSXVUr1cpz79bm3TE6c5=4oo-Eeg@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 0/8] fanotify tests for v5.13
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

On Fri, Mar 19, 2021 at 3:04 PM Petr Vorel <pvorel@suse.cz> wrote:
>
> Hi Amir,
>
> > Hi Petr,
>
> > Following tests were used for development of the two features
> > queued for v5.13 (in linux-next):
> > - Performance improvements for events merge [1]
> > - Unprivileged fanotify listener [2]
>
> As these are features not fixes, I suppose nothing from these already merged 2
> patchsets in next tree can be added with struct tst_tag to document it.
> I wonder if any of these are could be at least noted in the tests / commit
> messages.
>

Whatever you think is best for your project users.
If you want to document the commits that added the features, I suggest
that you wait until those commits hit master (next cycle).
These are the relevant commit subjects:

   fanotify: configurable limits via sysfs
   fanotify: support limited functionality for unprivileged users

Thanks,
Amir.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
