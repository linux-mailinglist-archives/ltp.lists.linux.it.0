Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A9281E039E
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 14:12:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 516233C22C3
	for <lists+linux-ltp@lfdr.de>; Tue, 22 Oct 2019 14:12:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 7887D3C12EB
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:12:24 +0200 (CEST)
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 051D214010EB
 for <ltp@lists.linux.it>; Tue, 22 Oct 2019 14:12:23 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4F0F9AC93;
 Tue, 22 Oct 2019 12:12:23 +0000 (UTC)
Date: Tue, 22 Oct 2019 14:12:22 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Xiang Li <lixian@qti.qualcomm.com>
Message-ID: <20191022121222.GA15798@rei>
References: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0641c15377874db893088e4f65102ec6@aptaiexm02f.ap.qualcomm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] Bug report in read_all.c
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi!
> Modifying i + 1 to (i + 1) % QUEUE_SIZE at the source code Line#123 can easily fix it.
> This bug is not triggered on every machine because the files are different between target machine.
> Adjust the length of the QUEUE_SIZE will help you reproduce this bug.

Can you send a patch that I can apply (ideally with the suggestion from
Ritchie as well)?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
