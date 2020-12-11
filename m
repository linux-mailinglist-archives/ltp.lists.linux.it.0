Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AE82D7576
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 13:21:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B31573C61AC
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Dec 2020 13:21:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 29CFC3C2A77
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 13:21:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 51254600B0A
 for <ltp@lists.linux.it>; Fri, 11 Dec 2020 13:21:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8641BAE87;
 Fri, 11 Dec 2020 12:21:35 +0000 (UTC)
Date: Fri, 11 Dec 2020 13:21:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <X9NkTfGP4WygA/6l@pevik>
References: <20201208162440.14538-1-alexey.kodanev@oracle.com>
 <X9M4ol3AqYU8YtZQ@pevik>
 <4b2f0cc7-2caf-34a5-12c2-6d0c33bfcbf0@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4b2f0cc7-2caf-34a5-12c2-6d0c33bfcbf0@oracle.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] lib/tst_net.sh: add getopts to tst_ping()
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

> > BTW -f does not require root (but effectively it's required by netns setup).

> Hi Petr,

> Are sure -f doesn't require root?
Sorry, I was wrong (tested on latest iputils release):

ping localhost -f
ping: cannot flood; minimal interval allowed for user is 200ms

> >> * Replace '-i 0' with '-f'
> > Out of curiosity, why flood ping is better than -i 0?
> > More effective stressing?

> I think it's better to use the option that is specially made
> for this, isn't it? AFAIK, -f won't do verbose printing, though
> we could add -q too along with -i 0...

+1

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
