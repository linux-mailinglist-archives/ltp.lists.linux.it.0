Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C7199151DE4
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 17:10:11 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 360003C24D8
	for <lists+linux-ltp@lfdr.de>; Tue,  4 Feb 2020 17:10:11 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2121B3C2368
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 17:10:07 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 9C82F201368
 for <ltp@lists.linux.it>; Tue,  4 Feb 2020 17:10:02 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id ECA4EAEF5;
 Tue,  4 Feb 2020 16:10:01 +0000 (UTC)
Date: Tue, 4 Feb 2020 17:09:58 +0100
From: Cyril Hrubis <chrubis@suse.cz>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20200204160949.GA6271@rei>
References: <20200130110753.20459-1-pvorel@suse.cz>
 <e6f7f611-7c2e-04cb-afd9-e11c4423dc3f@cn.fujitsu.com>
 <20200204155703.GA16838@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200204155703.GA16838@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/1] autotools: Move simple definitions out of
 m4/* to configure.ac
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
> > IMO, move all simple definitions to configure.ac will make this file mess
> > likce old .gitnore file. I perfer to add function or header or macro but not
> > include struct in configure.ac.
> I think .gitignore files are different because it's content cannot be duplicated
> when they're split, but m4/ repeated some checks.
> + we already started to move configuration into configure.ac before
> (AC_CHECK_HEADERS and AC_CHECK_FUNCS).
> IMHO it's easier to search/work with single file than in many files with very little
> content.

The main reason for having a separate .gitignore files are:

* To avoid patch collisions that would happen too often

* When directory is deleted the .gitignore records are removed as well

* Also the files are much easier to maintain if there are only few
  entries, as we do not have to find stuff


In that sense the configure file is different, collisions are generally
rare and an stuffing things into m4 files is not much cleaner than
having it directly in the configure.ac

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
