Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 3766A148564
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 13:48:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D56643C23EE
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jan 2020 13:48:53 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id 0046F3C0B90
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 13:48:49 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 6F4781A0178B
 for <ltp@lists.linux.it>; Fri, 24 Jan 2020 13:48:49 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CFAD4ADFB;
 Fri, 24 Jan 2020 12:48:48 +0000 (UTC)
Date: Fri, 24 Jan 2020 13:48:47 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Yang Xu <xuyang_jy_0410@163.com>
Message-ID: <20200124124847.GB31214@rei.lan>
References: <239304412.3515101.1579791334045.JavaMail.zimbra@redhat.com>
 <20200123151836.29484-1-mdoucha@suse.cz>
 <b2a63820-656c-de66-cde2-ce91c62e52b6@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2a63820-656c-de66-cde2-ce91c62e52b6@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Fix prctl02
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
> > The prctl() system call takes 5 integer arguments but only 3 of them were
> > passed in the test. This means that the system call read random garbage
> > from stack in place of the two missing arguments and failed even on some
> > perfectly valid combinations of arguments on some platforms.
> > 
> > - Change num_invalid to ULONG_MAX
> > - Fix arguments in test case 9, 13 and 14
> > - Fix test call of prctl() to have all 5 arguments
> looks prctl manpages and kernel code, you are right, Thanks for the fix!
> Feel free to add??
> Reviewed-by: xuyang_jy_0410@163.com
> Tested-by: xuyang_jy_0410@163.com
> 
> Also, do we should use 5 arguments for other prctl test cases?

It depends on the option argument, the PR_CAP_AMBIENT explicitely states
that arg4 and arg5 must be set to 0 as well as the
PR_GET_SPECULATION_CTRL.

Some of the options explicitely say that some arguments are ignored.

And some, including PR_SET_NO_NEW_PRIVS does not say anyting.

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
