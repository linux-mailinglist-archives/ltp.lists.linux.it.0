Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA641CD7FE
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 13:24:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id ABCA23C5610
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 13:24:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 7823E3C268F
 for <ltp@lists.linux.it>; Mon, 11 May 2020 13:23:59 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id BEB2C601100
 for <ltp@lists.linux.it>; Mon, 11 May 2020 13:23:58 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id u10so3806051pls.8
 for <ltp@lists.linux.it>; Mon, 11 May 2020 04:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vun5soIrlVa5FvmP5BCA8t2TJ0QD/cpZg2E9b1tYGds=;
 b=z2Xp6MP2V596HXRo77+kqzyMXKNV/zzp3SR2QUrq2hi+dBRauRNdmFwVDtVhbvW5A3
 7powcv+RwJUcTiULzdI2NisLariQ0q/VeQnbOrnlzFE7ruAw3LfTtGa/2mCIW26cO9CL
 GF8tlTZr6JlrXabHE6jccHXpwP9QOb4b5DfX3vWKTAAJ0ozCgk5J+xPxJr+lhe/70t7O
 Df00mxhHWnPk6Vc3ykJqsFiqUlUAzb73ZDVFbSPADY3to6WNUEkFys8RCmlEwfZJ2FO6
 LtkzwKuFiBBNsg4lc3zn28YC2YrKekVeqlREVCD6K9+7nq5nqw7VQch6H0rjGNthG9/p
 jIoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vun5soIrlVa5FvmP5BCA8t2TJ0QD/cpZg2E9b1tYGds=;
 b=QnTqIOlXui71YyyS4n2NMm1vXQ7Zcn2OwPJmZneNyrvrNgE8/K/S629wvL5oDl1TrQ
 VQj8ylH6/AqQvCNui9S5RDFhJc1naMyhIuQ4Dcrd4Dvt9YNaCVaI7HwxE7WQEcWNorFI
 EdxgCaLs+vF8cV5nh+ae6C0eX3oCZnOyb8SmPgjwEXq5pWYo3kiZk6IzTjwoku09M6sF
 UxlbbllM2e+TmXuBxlYlEvCmIeYQsJr79hQCD93EZqQt1idTIpEOCKnuXDJGmY6ETGhR
 u/M6b2j9XyXjd7Kn4OgMm4TZGubIbYxgpvN7zUexTmXXaToPBSwlSDGLqt+8FLge2YJj
 WkJw==
X-Gm-Message-State: AGi0PuYB9QCEKEobcnf7FBoC/mqfxTqwRPlBWKxXGAE4DKE5aUyT50Uw
 d6tw2EJYwIDzomhdUErqGuhqug==
X-Google-Smtp-Source: APiQypInlvnYL+UL6H+PG2ZUOY+asi1edXpjQ+I+DN7YEQDxc8vg/+pPVwrC2z3kxVwDrcotwYJZ0A==
X-Received: by 2002:a17:90b:3547:: with SMTP id
 lt7mr15789148pjb.14.1589196237353; 
 Mon, 11 May 2020 04:23:57 -0700 (PDT)
Received: from localhost ([122.167.130.103])
 by smtp.gmail.com with ESMTPSA id i12sm273386pgi.21.2020.05.11.04.23.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 04:23:56 -0700 (PDT)
Date: Mon, 11 May 2020 16:53:54 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Message-ID: <20200511112354.3u5r6vmu74knpst6@vireshk-i7>
References: <cover.1588911607.git.viresh.kumar@linaro.org>
 <8a675726b6e553e740016390c774bce19efc5a12.1588911607.git.viresh.kumar@linaro.org>
 <CAK8P3a1x+uK_WgVn9O8LVcLoZH=oJ_jQcePwcwzqpyhewApX9w@mail.gmail.com>
 <20200511064929.pa4lydt2vfryl7ve@vireshk-i7>
 <CAK8P3a2y+8kv0Wa4iiU+vGeNTudmx3aJJQ87zfi9WyfWKJ7WYg@mail.gmail.com>
 <20200511073315.gws5lhw6tsaaijpi@vireshk-i7>
 <CAK8P3a3VrcpdmGZB_VOLk17uDMxAfYyfM57yUUUSuqEdKvROOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3VrcpdmGZB_VOLk17uDMxAfYyfM57yUUUSuqEdKvROOQ@mail.gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH V2 15/17] syscalls/semtimedop: Add support for
 semtimedop and its time64 version
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 11-05-20, 09:58, Arnd Bergmann wrote:
> We should still check that five variants of it (sys_semop,
> sys_semtimedop, sys_semtimedop64, ipc(SEMTIMEDOP) and ipc(SEMOP))
> correctly implement the semop semantics

How do you suggest I add tests for ipc() types? Should they be always
tested? Or they should be tested only if the normal sys_* variant
isn't implemented by the kernel/arch ?

-- 
viresh

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
