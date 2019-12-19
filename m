Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C75125BE0
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 08:08:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7ABC73C2391
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 08:08:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id D20B33C131B
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 08:08:48 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3A4B32011C7
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 08:08:47 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 11CCDAF40;
 Thu, 19 Dec 2019 07:08:47 +0000 (UTC)
Date: Thu, 19 Dec 2019 08:08:45 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191219070845.GA25978@dell5510>
References: <20191217171918.10237-1-alexey.kodanev@oracle.com>
 <20191217171918.10237-2-alexey.kodanev@oracle.com>
 <20191218084406.GA10966@dell5510>
 <f0aad696-82a5-fb06-0517-a437d95ae2e7@oracle.com>
 <20191218152832.GA26689@dell5510>
 <853a8441-efc3-03e2-4889-1421cbe976b5@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <853a8441-efc3-03e2-4889-1421cbe976b5@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/2] network/iptables: add new test for
 iptables-tranlsate and nft
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

Hi Alexey,

> > BTW even more setup could be moved into iptables_lib.sh.
> > If you like this change, I can push it.

> No objections. I thought it is better to keep these TST_*
> variables per test, in the header, rather than searching
> in the lib... but looks like it might save some duplication.

The main reason for me to move TST_* variables into library is to keep code
together, where it's used.
The downside of it is that these variables may be accidentally overwritten by
setup in test. That's why I used default values, which can be overwritten in
if-lib.sh.

I'll send a patch, feel free to not ack that (agree, that it's a syntax
optimization, the test itself is what matters).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
