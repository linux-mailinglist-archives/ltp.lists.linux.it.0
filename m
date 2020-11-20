Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D42BAAC2
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 14:03:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E82493C5F54
	for <lists+linux-ltp@lfdr.de>; Fri, 20 Nov 2020 14:03:50 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1D2593C2DF3
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 14:03:47 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A7C8A140138E
 for <ltp@lists.linux.it>; Fri, 20 Nov 2020 14:03:46 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D73DCAC23;
 Fri, 20 Nov 2020 13:03:45 +0000 (UTC)
Date: Fri, 20 Nov 2020 14:04:35 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: j.nixdorf@avm.de
Message-ID: <20201120130435.GA20520@yuki.lan>
References: <20201119130046.GA12628@yuki.lan> <20201118135852.GA13912@yuki.lan>
 <OFFFCF0315.CB01D2B7-ONC125861F.003C7A03-C1258622.0045EF86@avm.de>
 <OFFDAAA0B7.3C11EE41-ONC1258625.002F2EA3-C1258625.002FFCAE@avm.de>
 <OF2A463655.07C868E8-ONC1258626.00412BF5-C1258626.0041A363@avm.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF2A463655.07C868E8-ONC1258626.00412BF5-C1258626.0041A363@avm.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] getdents: update to the new api,
 don't mix libc and kernel types
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
Pushed with a minor changes, thanks.

* Removed the GPL license text since it's replaced by the SPDX identifier

* Formatted the test description into asciidoc and changed the comment
  so that it's picked up by documentation parser

* Checked explictily for -1 return value in negative test

* Made use of TERROR flags instead of usings strerror() to print errnos

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
