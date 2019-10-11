Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CD6D3F2C
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 14:06:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CD86E3C2284
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 14:06:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 1D7613C1447
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 14:06:38 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 093D26023A1
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 14:06:36 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 45EDBAFA9;
 Fri, 11 Oct 2019 12:06:36 +0000 (UTC)
Date: Fri, 11 Oct 2019 14:06:34 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20191011120633.GC2591@rei>
References: <20191011095442.10541-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011095442.10541-1-pvorel@suse.cz>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v5 0/5] shell: Introduce TST_TIMEOUT variable
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
> Changes v4->v5:
> * remove float related code (left from v3)
> * remove "tst_test_cmds cut" check from tst_test.sh (there is check for
> cut and other later => it should be probably removed as well, but as a
> separate patch) (Cyril)
> * remove unneeded IFS from test (Cyril)
> * mention ceiling LTP_TIMEOUT_MUL in doc/user-guide.txt
> 
> Here is the diff:
> diff --git doc/user-guide.txt doc/user-guide.txt
> index 8913c3221..7f6334ec2 100644
> --- doc/user-guide.txt
> +++ doc/user-guide.txt
> @@ -15,7 +15,7 @@ For running LTP network tests see `testcases/network/README.md`.
>                            'n' or '0': never colorize.
>  | 'LTP_TIMEOUT_MUL'     | Multiply timeout, must be number >= 1 (> 1 is useful for
>                            slow machines to avoid unexpected timeout).
> -                          Variable is also used in shell tests.
> +                          Variable is also used in shell tests, but here ceiled to int.
                                                                        ^
									Drop
									the
									"here"

Other than that it's fine, you can add my Reviewed-by:

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
