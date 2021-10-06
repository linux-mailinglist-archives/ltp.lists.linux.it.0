Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DB993424672
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Oct 2021 21:08:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8DD113C7F3D
	for <lists+linux-ltp@lfdr.de>; Wed,  6 Oct 2021 21:08:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3A8DF3C6557
 for <ltp@lists.linux.it>; Wed,  6 Oct 2021 21:08:08 +0200 (CEST)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 24CD214002B6
 for <ltp@lists.linux.it>; Wed,  6 Oct 2021 21:08:08 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id v25so11790175wra.2
 for <ltp@lists.linux.it>; Wed, 06 Oct 2021 12:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
 :content-disposition:in-reply-to;
 bh=UjqJqLLIonyBl/fEnrRc3ZDS8QCjcSTphhs9Epv9YFs=;
 b=Om2t+2C9YHz6R1IPkz+0F+fJExUS2ltaLwjW/Dytdc0O8BmX1Gm5kI8GZL/gvuAu4X
 qThGa3FGpc/6K/HOcsLPlOJNTDrhDHc35kItqhXlLcKJMOcVbm14/rLOPuQxz37oJJbH
 TlLFF3xGuWD6L/nRBGDq0A2XnN4l270T95HpzsY0Ch0pTSD2iim++YxshJT2/FQakxsL
 owvgieZneuL2M4+FabpawBcwrRRHqQAJkxF9ak6kHBPqQJNSPPPJDWFOSFmOhNGuJFqP
 ZsNQuCnzocbpPbHZ6t0wGlLe2jvAIfU0qfKuRrn5yaeR/pAIO91lMQLrKmkNwI1OG6K/
 KnBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=UjqJqLLIonyBl/fEnrRc3ZDS8QCjcSTphhs9Epv9YFs=;
 b=AAN+z33mcxal4h8UQC2t3fhCujUMXc+NIA0/rLfeu3ysLDmtJJE1V3bBLMTN8icya8
 EBUrxtSBUb/m1bw2HV0gLL5ML9p+4dVXhMenr9fIO11ObSaQxRzWjFi4K1ceg4wKjqHN
 d7M/KQzOXuxVA+2Fs2/9dOKzn90ZqoeL2eHMDSQv51yh3qFDs/RUM2r8ChtTHy4fA0vx
 hvkY9UGPy6r4n8pLk++Qg2kuEXg5eshW1B355KLx0ATGa8cpI7CgY1R+mch7iLxn6nsf
 FdjymBdC3e6yraAhjaM0XMaSNogyGqjAZlLLMzWsTnBWCJlpbPlhKOnYY/IF53xiVwjW
 u+jw==
X-Gm-Message-State: AOAM531iSOAycQ3HhwLZgF3xkliRNTyHzbge/ZNN1K+AAGFTL/6OrTNo
 IsoKc0Bvbs9HhVAPeG6WFss=
X-Google-Smtp-Source: ABdhPJwXWH13biCav+++X52+kE2gMqbg4HD/RVb+8bNBaLgsSjjPQ40xtCIOzEbMhfuNOtc6HIwzZg==
X-Received: by 2002:adf:b1d7:: with SMTP id r23mr18539389wra.145.1633547287719; 
 Wed, 06 Oct 2021 12:08:07 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id b13sm4881952wmj.3.2021.10.06.12.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 12:08:07 -0700 (PDT)
Date: Wed, 6 Oct 2021 21:08:03 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <YV30E/UL73VJ3AYf@pevik>
References: <20210930183058.5240-1-petr.vorel@gmail.com>
 <20210930183058.5240-4-petr.vorel@gmail.com>
 <YV2r5IvFeiVIoY9a@yuki>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YV2r5IvFeiVIoY9a@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH v2 3/3] lapi/if_addr.h: Define IFA_FLAGS
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: ltp@lists.linux.it, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

> Hi!
> Looks good, as long as it passed CI:
Sure, I tested it not only for affected buildroot, but for LTP CI.

Thus fixed commit message and merged.
Thanks a lot both for review.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
