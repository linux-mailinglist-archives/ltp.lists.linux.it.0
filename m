Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB92D2E937A
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 11:40:03 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 604FC3C3203
	for <lists+linux-ltp@lfdr.de>; Mon,  4 Jan 2021 11:40:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EF27A3C1D2E
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 11:40:01 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3B41C100048E
 for <ltp@lists.linux.it>; Mon,  4 Jan 2021 11:40:00 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83CE2AD18;
 Mon,  4 Jan 2021 10:40:00 +0000 (UTC)
Date: Mon, 4 Jan 2021 11:40:53 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Pankaj Vinadrao Joshi <Pankaj.VJ@exaleapsemi.com>
Message-ID: <X/LwtaAuxYlP+/m8@yuki.lan>
References: <BM1PR01MB3825BDAFB8CB55CA9C46F1D8EEDE0@BM1PR01MB3825.INDPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BM1PR01MB3825BDAFB8CB55CA9C46F1D8EEDE0@BM1PR01MB3825.INDPRD01.PROD.OUTLOOK.COM>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] Query: LTP CVE test cherry picking
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> I know LTP covers CVE tests but i want to know does LTP covers all CVE
> tests, how  LTP cherry picks it ??

There is not much to cherry pick. We write tests for CVEs if it's
feasible. That usually means that there is a public reproducer for the
CVE that could be turned into automated testcase, which is not always
the case.

We are sometimes notified about such cases by developers that are
working on security and it usually ends up as a github issue. We do have
a few of these there with a tag "reproducer" with a link to reproducer
and description. These issues then hangs in the issue until someone has
time to work on that.

To sum it up, implementation of CVE testcases in LTP is best effort and
we are trying to cover as much as possible with the manpower we have.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
