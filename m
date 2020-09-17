Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1D326D34A
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 07:53:54 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 079073C4E76
	for <lists+linux-ltp@lfdr.de>; Thu, 17 Sep 2020 07:53:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id D39033C2A87
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 07:53:49 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 678AC600D79
 for <ltp@lists.linux.it>; Thu, 17 Sep 2020 07:53:49 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C88B4AC68;
 Thu, 17 Sep 2020 05:54:03 +0000 (UTC)
Date: Thu, 17 Sep 2020 07:53:46 +0200
From: Petr Vorel <pvorel@suse.cz>
To: "Bird, Tim" <Tim.Bird@sony.com>
Message-ID: <20200917055346.GA17236@dell5510>
References: <CY4PR13MB11752979CBBBBCAD98EC86E0FD200@CY4PR13MB1175.namprd13.prod.outlook.com>
 <20200916070440.GA1433@dell5510>
 <CY4PR13MB11750B438B7F73126B88240BFD210@CY4PR13MB1175.namprd13.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CY4PR13MB11750B438B7F73126B88240BFD210@CY4PR13MB1175.namprd13.prod.outlook.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] ltp-selftest-quick runtest file (was RE:  LTP release)
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Tim,

...
> > > Is there a networking one with less requirements, that is basically guaranteed to work?
> > Good catch. Although TCONF is also a test for shell API :), let's use plan shell
> > implementation:
> > route6-change-dst route-change-dst.sh -6

> This one worked on some of my boards and not others, due to ipv6 not being
> configured on some of them.

> How about this instead:
> route4-change-dst route-change-dist.sh
ack.
(I consider TCONF as not failure, but let's use IPv4).

Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
