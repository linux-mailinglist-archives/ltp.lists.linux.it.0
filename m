Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D23EAD0C
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 11:04:46 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 427933C22C3
	for <lists+linux-ltp@lfdr.de>; Thu, 31 Oct 2019 11:04:46 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 94CF73C1452
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 11:04:44 +0100 (CET)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id C72E1140165D
 for <ltp@lists.linux.it>; Thu, 31 Oct 2019 11:04:42 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 211F1B1D1;
 Thu, 31 Oct 2019 10:04:42 +0000 (UTC)
Date: Thu, 31 Oct 2019 11:04:40 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Rachel Sibley <rasibley@redhat.com>
Message-ID: <20191031100440.GA24319@rei>
References: <f0844da9-2ed8-ee52-121d-ab97df7aff81@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f0844da9-2ed8-ee52-121d-ab97df7aff81@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Send CKI test reports to LTP list ?
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
> As part of the CKI project [1] we are responsible for testing upstream 
> kernels, you may have been cc'd
> on some of our reports in the past :-)
> 
> We test from a recent commit from ltp versus using the latest stable 
> version to be able to pull in recent
> fixes and new cases as needed. We update about once a month, and test 
> out changes before merging.
> 
> We were hoping we could start cc'ing the LTP ML on failures going 
> forward to help troubleshoot and
> review new failures as we find them in CKI. This would also help promote 
> better collaboration between
> CKI and LTP upstream community. Curious to know your thoughts on this 
> and if your ok with this approach?

Sounds good to me.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
