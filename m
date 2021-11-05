Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD97445E32
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 04:03:48 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1340D3C7339
	for <lists+linux-ltp@lfdr.de>; Fri,  5 Nov 2021 04:03:48 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7B5F43C6218
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 04:03:43 +0100 (CET)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id B9F30601D02
 for <ltp@lists.linux.it>; Fri,  5 Nov 2021 04:03:42 +0100 (CET)
Received: by mail-pj1-x1029.google.com with SMTP id
 t5-20020a17090a4e4500b001a0a284fcc2so2376665pjl.2
 for <ltp@lists.linux.it>; Thu, 04 Nov 2021 20:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ENaSXq8kZNBB1s/CTI7qDAEzO8pO6ylitmgeXnYHZ1s=;
 b=PPnulN+KOyC5/d8o4pyJga0JT44LvPDFOsEZofZ9UMmmk20XTc6XsAJPJsm1/54Rqg
 qoY2oBc2yUSgon6jLwKMD20ZeeQ1Rw4BOoKMejh6Epe19IzAAR1K5nbiVOZI/wG+bwXK
 nrDRJC+RebMjdVmNBhCfpYwEik7UN4q9PgLTwfGM4eWmAEwUIwO4YegT2Cd7NQSI4wMO
 9+pCS6IVU5YE0XuBzqgIsOtspg7cxWBBtQ2NOsesGmnrSUa4jVC78261TYLhLLoAXZ3p
 aMmvTOko5Pbg55F7YU2gMpPpfvmBCq8OedjoG3NXpIhPcVFrE2Wj/lE/eUqqpmO98tcI
 IsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ENaSXq8kZNBB1s/CTI7qDAEzO8pO6ylitmgeXnYHZ1s=;
 b=k0yvElxGhHpaW//pFoghEua4K0bXnGdXoRjul6qRYxmObBL9NGW+2AaSILIvS7Wg0J
 WTN/aqTDDsP7w14DfAmASbIYPOD3whqwQVQ4DcNYFfuWmhjYUK44Kmw7RaZjE7z3N3rj
 Awr6drei92LHrvR62wWlPWJbF1mizMqp0/mwgVnKXB8eNPVy7Oa2PTywgVmdXasHEu17
 SKpRZxKG7OWN7hkdDZdqbayFnM6Kh/aRvLv+gMTtm/ojforgk/7ahpHmeLb+dDJAGpyK
 /bsWshaJMb9z+G+gtBjm7LgEAnFYSMw+8MuU14zq0fT9zPZaKpNtEJbmhEo9P/zks4PT
 evfw==
X-Gm-Message-State: AOAM530sRx3UZ4R4aP9Kpwr+ou7Vu8S52ICvGpFNlcplFVDIlPOz5iDB
 r4UjGIlNIiQHGtukVTl07ud67A==
X-Google-Smtp-Source: ABdhPJxLq137VRVosq/NAfooJspgQfxX+N0kMzua1/0DHCnMEb3WqS1ZiQ3Wl1T+GQFb2jnE3B7JvQ==
X-Received: by 2002:a17:90a:4414:: with SMTP id
 s20mr23688535pjg.132.1636081421049; 
 Thu, 04 Nov 2021 20:03:41 -0700 (PDT)
Received: from google.com (64.157.240.35.bc.googleusercontent.com.
 [35.240.157.64])
 by smtp.gmail.com with ESMTPSA id k5sm6400105pfc.111.2021.11.04.20.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:03:40 -0700 (PDT)
Date: Fri, 5 Nov 2021 03:03:33 +0000
To: Amir Goldstein <amir73il@gmail.com>
Message-ID: <YYSfBUtvr5Tp4pi1@google.com>
References: <cover.1635849607.git.repnop@google.com>
 <b404edc9a25e9ec09fc975b1bac1947c5eb0408a.1635849607.git.repnop@google.com>
 <CAOQ4uxjhFNJkfKYuQdKpWtn4ZCMr3Er-mp+Jp0oekPTp2Xm1BQ@mail.gmail.com>
 <YYEd6cqlz+6PkIZu@google.com>
 <CAOQ4uxhvHkqXFvMrGaB9_WZ7gX_M8q9kxWri7Sn2g5Rmb2b-jw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOQ4uxhvHkqXFvMrGaB9_WZ7gX_M8q9kxWri7Sn2g5Rmb2b-jw@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-14.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,
 SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/2] syscalls/fanotify20: add new test for
 FAN_REPORT_PIDFD
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
From: Matthew Bobrowski via ltp <ltp@lists.linux.it>
Reply-To: Matthew Bobrowski <repnop@google.com>
Cc: Gabriel Krisman Bertazi <krisman@collabora.com>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Nov 02, 2021 at 02:15:51PM +0200, Amir Goldstein wrote:
> On Tue, Nov 2, 2021 at 1:16 PM Matthew Bobrowski <repnop@google.com> wrote:
> >
> > On Tue, Nov 02, 2021 at 01:02:48PM +0200, Amir Goldstein wrote:
> > > On Tue, Nov 2, 2021 at 12:57 PM Matthew Bobrowski <repnop@google.com> wrote:
> > > >
> > > > This test ensures that the fanotify API returns the expected error
> > > > status code -EINVAL when an invalid flag is supplied alongside the new
> > > > FAN_REPORT_PIDFD initialization flag. Currently, FAN_REPORT_TID is the
> > > > only initialization flag that is not permitted in conjunction with
> > > > FAN_REPORT_PIDFD, so we explicitly provide test coverage for this.
> > > >
> > > > We also add an extra trivial test case to ensure that the
> > > > initialization behavior with the other FAN_REPORT_* related flags is
> > > > working as intended.
> > > >
> > > > Signed-off-by: Matthew Bobrowski <repnop@google.com>
> > > > Reviewed-by: Amir Goldstein <amir73il@gmail.com>
> > > > ---
> > > > Changes since v1:
> > > >  - Introduced a new macro
> > > >    REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_BY_KERNEL() that is
> > > >    responsible for testing whether the supplied initialization flags
> > > >    are supported by the underlying kernel. This is used from
> > > >    do_setup(). Using this is less ambiguous then using something like
> > > >    REQUIRE_FANOTIFY_INIT_FLAGS_SUPPORTED_ON_FS().
> > >
> > > Not like this.
> > > Please start your branch with the first two prep patches from
> > > Gabriel's LTP post (including my reviewed-by tag) preserving
> > > Gabriel's authorship and signed-of-by and adding your own
> > > signed-off-by.
> > >
> > > Your LTP tests are expected to be merged before Gabriel's test
> > > because your tests are for a 5.15 feature.
> > > Once your tests are merge, Gabriel would be able to rebase on master
> > > and drop his prep patches.
> >
> > Am I reading all the words, or only some of the words?
> >
> > AFAICT, the macro that I've defined here is different to that of what
> > has been implemented in Gabriel's series.
> >
> 
> My bad.
> I wasn't paying attention to the difference.
> It wouldn't hurt to split the macro patch anyway.

Right, I'll split and repost the series.

Thanks for the review!

/M

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
