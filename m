Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6DC29420C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 20:20:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B9C593C56E6
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Oct 2020 20:20:03 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id A96F53C2639
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 20:20:01 +0200 (CEST)
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 0C7801000369
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 20:20:00 +0200 (CEST)
Received: by mail-qt1-x844.google.com with SMTP id c5so1899143qtw.3
 for <ltp@lists.linux.it>; Tue, 20 Oct 2020 11:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=M85fSv8BahcDlCF9UJ6M+uu0ObrHdHEDxKjhsgKNBhM=;
 b=ZPhxZ0k738FNf0pe63JAjf7fr2+0N1EA6+c9mgp2fQePMiVd/CJlxck0574RVWRq68
 V3z/IBkT6SQ8vyg8exe/E/JIKmHWMH3h3h52e02ldSJWUS9awkfRj869O5+09AXFzpb1
 2AsaBczZz9XDGMRQwKbmummZMojEqAbBUP0RRQhLSSmqn9mjuxlxSk8aOgnQ/xPCa2Mq
 jAm93wjtbYii0VyHCUk0RZzEcgvzB1Mzcp9e/r/cH1CiSO0yQ4PPScQpDzkBSYxIsbeP
 /VBBYhTELV9A05uyqJffdxQcf1Hn72c1md2LW+IcFStT6dyZs69j9CZNa6Unslh9pRAT
 F4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=M85fSv8BahcDlCF9UJ6M+uu0ObrHdHEDxKjhsgKNBhM=;
 b=P1I9//nCMeaRjEuBuIZSEF5ZolTNUYzPUTuRvXC465Q1v5RPdk/4sdBKI87DeMScEC
 2rt9waP/5uAXNdjVK9zD9pulfc3uJtYynak3u6qo2sFaB82pcLBDRQLvuUStJShOHoDf
 jZgQXpIMUJzGZCbfVTwl1zussH2fWKucJNeRz8zWlGEBicG715ZrPeTJnF2f/aGyNu6g
 cP37T7OMIG0Uh1HKZ4rWQWLhFQgvmdY+7uo6gyiKUWLnwCOVpNjMbCWb9Acw6f1Obq6h
 sIxkZJF8JPnytyOOf9WRi4KIKetObiojy6Sa3+0O9CK7j/Ior2QBQuerH4pMQARO9kDe
 vtew==
X-Gm-Message-State: AOAM531Rlp1mR6JLzB3obZxmPZ8zDKswdJ/3EJaZxbzYK9cSr9+AnOx6
 uiWaK2cesZGM1Yutp9Q2M9XZiQ==
X-Google-Smtp-Source: ABdhPJzpXkKUy7ZqEVOQzOGaY9mnFlvxyTDpsTnXUSYQQideZaK50gy7objTxpfsEPoNPct8KhwJXQ==
X-Received: by 2002:ac8:3f9a:: with SMTP id d26mr3766872qtk.246.1603217999891; 
 Tue, 20 Oct 2020 11:19:59 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:c52c])
 by smtp.gmail.com with ESMTPSA id p23sm1139882qkm.126.2020.10.20.11.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 11:19:59 -0700 (PDT)
Date: Tue, 20 Oct 2020 14:18:22 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Roman Gushchin <guro@fb.com>
Message-ID: <20201020181822.GA397401@cmpxchg.org>
References: <20201014190749.24607-1-rpalethorpe@suse.com>
 <20201016094702.GA95052@blackbook>
 <20201016145308.GA312010@cmpxchg.org>
 <20201016171502.GA102311@blackbook>
 <20201019222845.GA64774@carbon.dhcp.thefacebook.com>
 <20201020162714.GC46039@blackbook>
 <20201020170717.GA153102@carbon.DHCP.thefacebook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201020170717.GA153102@carbon.DHCP.thefacebook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH] mm: memcg/slab: Stop reparented obj_cgroups
 from charging root
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
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 Richard Palethorpe <rpalethorpe@suse.com>, linux-mm@kvack.org,
 Shakeel Butt <shakeelb@google.com>, Vlastimil Babka <vbabka@suse.cz>,
 Tejun Heo <tj@kernel.org>, Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
 Christoph Lameter <cl@linux.com>, Michal Hocko <mhocko@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Tue, Oct 20, 2020 at 10:07:17AM -0700, Roman Gushchin wrote:
> If we want these counter to function properly, then we should go into the opposite
> direction and remove the special handling of the root memory cgroup in many places.

I suspect this is also by far the most robust solution from a code and
maintenance POV.

I don't recall the page counter at the root level having been a
concern in recent years, even though it's widely used in production
environments. It's lockless and cache compact. It's also per-cpu
batched, which means it isn't actually part of the memcg hotpath.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
