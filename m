Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB126FBB8
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Sep 2020 13:42:37 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 68C513C4E5E
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Sep 2020 13:42:36 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 557D43C209D
 for <ltp@lists.linux.it>; Fri, 18 Sep 2020 13:42:35 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D787D200969
 for <ltp@lists.linux.it>; Fri, 18 Sep 2020 13:42:34 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F4207B24A;
 Fri, 18 Sep 2020 11:43:07 +0000 (UTC)
Date: Fri, 18 Sep 2020 13:43:01 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200918114301.GA13453@yuki.lan>
References: <20200911035533.30538-1-liwang@redhat.com>
 <20200911130836.GA2582@yuki.lan>
 <CAEemH2fPRTh6drs=h=U7OG07SZDgpDfEB0xRadF8Y1FbaHR8Nw@mail.gmail.com>
 <20200911145730.GA6157@yuki.lan>
 <CAEemH2cXY+-Dgq8PB-ZunzRnjM1iH0KiB5gK5=CLnFDSEiKLdQ@mail.gmail.com>
 <20200915134023.GA18311@yuki.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915134023.GA18311@yuki.lan>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5] Add a test case for mmap MAP_GROWSDOWN flag
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
Cc: pravin <pravinraghul@zilogic.com>, LTP List <ltp@lists.linux.it>,
 "Vijay Kumar B ." <vijaykumar@zilogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Li are you working on this, or should I try to finish the test?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
