Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 57838177575
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:49:25 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 14E5C3C66E0
	for <lists+linux-ltp@lfdr.de>; Tue,  3 Mar 2020 12:49:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 7F5B03C66D4
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:49:23 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 21061600443
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 12:49:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 86273AB3D
 for <ltp@lists.linux.it>; Tue,  3 Mar 2020 11:49:22 +0000 (UTC)
Date: Tue, 3 Mar 2020 12:37:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20200303113746.GB42769@gacrux.arch.suse.de>
References: <20200221120850.15874-1-mdoucha@suse.cz>
 <20200303104737.GA42129@gacrux.arch.suse.de>
 <20200303110249.GB42129@gacrux.arch.suse.de>
 <20200303112725.GA24389@rei.lan>
 <74b99e9f-12a3-6d5b-2d14-16fd3cbd4c71@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <74b99e9f-12a3-6d5b-2d14-16fd3cbd4c71@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add test for CVE 2017-10661
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

Hi Martin,

> Ah, right. I broke the Makefile when I deleted the unconditional LDLIBS
> line... The -lpthread was useless but I didn't realize the -lrt was needed.

> I'll resubmit with all fixes mentioned so far then.
OK, thanks for doing new version.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
