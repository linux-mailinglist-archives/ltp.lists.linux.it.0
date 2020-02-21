Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C66C167D3D
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 13:16:22 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1973D3C20BC
	for <lists+linux-ltp@lfdr.de>; Fri, 21 Feb 2020 13:16:22 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 4B5F93C13DA
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 13:16:21 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 0C6811407103
 for <ltp@lists.linux.it>; Fri, 21 Feb 2020 13:16:20 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4EEC7AC52;
 Fri, 21 Feb 2020 12:16:20 +0000 (UTC)
Date: Fri, 21 Feb 2020 13:16:18 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20200221121618.GA16421@dell5510>
References: <20200208092014.24824-1-liwang@redhat.com>
 <20200218162739.GA9985@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218162739.GA9985@rei.lan>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v4 1/2] lib: add .request_hugepages to reserve
 hugepage
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li, Cyril,

> > +	if (FILE_LINES_SCANF("/proc/meminfo",
> > +				"MemAvailable: %ld", &mem_avail)) {
> > +		/*
> > +		 * Using "MemFree:" on kernel that doesn't have
> > +		 * "MemAvailable:" in Meminfo
> > +		 */
> > +		tst_res(TINFO, "MemAvailable: not found in /proc/meminfo");
> > +
> > +		mem_avail = SAFE_READ_MEMINFO("MemFree:");
> > +	}

> I guess that we don't have to bother with MemAvailable here, since we do
> drop the system caches the MemFree should be equal to MemAvailable. So I
> would be for reading just MemFree unconditionally here.

> If you agree with this change I can change it before applying.

Merged both patches with this change and my docs change.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
