Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CFF1268CB
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 19:17:42 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9E08D3C23C2
	for <lists+linux-ltp@lfdr.de>; Thu, 19 Dec 2019 19:17:41 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id EA63A3C147F
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 19:17:36 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 60591200DE5
 for <ltp@lists.linux.it>; Thu, 19 Dec 2019 19:17:35 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E615DACAE;
 Thu, 19 Dec 2019 18:17:34 +0000 (UTC)
Date: Thu, 19 Dec 2019 19:17:33 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <20191219181733.GA23391@dell5510>
References: <20191219072638.31824-1-pvorel@suse.cz>
 <0805dbe9-e769-1073-10e0-ca42c9d06052@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0805dbe9-e769-1073-10e0-ca42c9d06052@oracle.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] iptables: Reduce code duplicity
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

> Lgtm, except the removing of the variables, which were initializing
> with 0 (including cleanup_ ones). I know, it's very unlikely, but what
> if someone use the same name already elsewhere, then we get unexpected
> results for the test:

> # export use_iptables=1
> # nft01.sh 
> nft01 1 TINFO: timeout per run is 0h 5m 0s
> nft01 1 TINFO: INIT: Flushing all rules
> nft01 1 TINFO: iptables -L -t filter will list all rules in table filter
> nft01 1 TINFO: iptables -L -t filter lists rules

Right, this makes sense. Thanks for review, merged with variables kept.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
