Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E477D3FAE
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 14:39:52 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 382DC3C2215
	for <lists+linux-ltp@lfdr.de>; Fri, 11 Oct 2019 14:39:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id EA3F63C144F
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 14:39:47 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 5860B1000D2D
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 14:38:01 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DDF91ACC3;
 Fri, 11 Oct 2019 12:39:46 +0000 (UTC)
Message-ID: <1570797586.4238.9.camel@suse.de>
From: Clemens Famulla-Conrad <cfamullaconrad@suse.de>
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
Date: Fri, 11 Oct 2019 14:39:46 +0200
In-Reply-To: <20191011095442.10541-1-pvorel@suse.cz>
References: <20191011095442.10541-1-pvorel@suse.cz>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
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
Reply-To: cfamullaconrad@suse.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On Fri, 2019-10-11 at 11:54 +0200, Petr Vorel wrote:
> Hi,
> 
> hopefully the latest version.
> 
> Changes v4->v5:
> * remove float related code (left from v3)
> * remove "tst_test_cmds cut" check from tst_test.sh (there is check
> for
> cut and other later => it should be probably removed as well, but as
> a
> separate patch) (Cyril)
> * remove unneeded IFS from test (Cyril)
> * mention ceiling LTP_TIMEOUT_MUL in doc/user-guide.txt
> 
> 
<snip>

For me this patchset looks good. I only add some nit comments on the
tests, can be taken or not.

Thanks
Clemens


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
