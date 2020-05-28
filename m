Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 391CD1E5E87
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:41:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id DD71D3C31C4
	for <lists+linux-ltp@lfdr.de>; Thu, 28 May 2020 13:41:01 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id AA61C3C31C0
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:40:57 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 2116E243166
 for <ltp@lists.linux.it>; Thu, 28 May 2020 13:40:56 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 019C8AC46
 for <ltp@lists.linux.it>; Thu, 28 May 2020 11:40:55 +0000 (UTC)
Date: Thu, 28 May 2020 13:40:54 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20200528114054.GA16726@dell5510>
References: <20200528110554.10179-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200528110554.10179-1-pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 0/2] LVM: Drop legacy scripts and runtest files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

growfiles are used also in other runtest files: fs, fs_readonly, scsi_debug.part1.
I wonder how to reduce duplicity for fs and fs_readonly.

runtest/scsi_debug.part1 should be IMHO deleted. And
testscripts/ltp-scsi_debug.sh should be either deleted, or, if the idea is
valid (using scsi_debug kernel module for testing), it should be rewritten.

Other candidate for deleting are ltpfs tests (testcases/kernel/fs/scsi/ltpfs/).
They're not maintained, ltpfsio.sh and ltpfstest is not even installed.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
