Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 675272DE1F3
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 12:27:53 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0B8243C57AC
	for <lists+linux-ltp@lfdr.de>; Fri, 18 Dec 2020 12:27:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 8BA6E3C0041
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 12:27:51 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 12D12200E03
 for <ltp@lists.linux.it>; Fri, 18 Dec 2020 12:27:50 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D1D7AC7B;
 Fri, 18 Dec 2020 11:27:50 +0000 (UTC)
Date: Fri, 18 Dec 2020 12:27:48 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Mimi Zohar <zohar@linux.ibm.com>
Message-ID: <X9ySNMlhYIMKd+SY@pevik>
References: <20201214221946.6340-1-pvorel@suse.cz>
 <20201214221946.6340-2-pvorel@suse.cz>
 <aed2e8ee7b05772a8cc2988ae275282bec7ef504.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aed2e8ee7b05772a8cc2988ae275282bec7ef504.camel@linux.ibm.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=1.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS,
 SUSPICIOUS_RECIPS autolearn=disabled version=3.4.4
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 1/4] IMA: Move get_algorithm_digest(),
 set_digest_index() to ima_setup.sh
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
Cc: Tushar Sugandhi <tusharsu@linux.microsoft.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 linux-integrity@vger.kernel.org, Mimi Zohar <zohar@linux.vnet.ibm.com>,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Mimi,

> Hi Petr,

> Thank you!

> On Mon, 2020-12-14 at 23:19 +0100, Petr Vorel wrote:
> > To be reusable by more tests (preparation for next commit).

> > Call set_digest_index() inside get_algorithm_digest() if needed
> > instead of expecting get_algorithm_digest() caller to call
> > set_digest_index() before.

> For the existing builtin templates, the algorithm/digest field is
> consistent.  With support for per policy rule template formats, there
> isn't necessarily a single template format for the entire list.

> In the future "set_digest_index" might need to be renamed to
> "get_digest_index" and the lookup done for each line.
Thanks for info, noted as TODO. Policy example would speedup fixing.


Kind regards,
Petr

> > Signed-off-by: Petr Vorel <pvorel@suse.cz>

> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
