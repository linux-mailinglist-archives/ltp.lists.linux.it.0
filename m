Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D61622D7
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:55:39 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C4F843C2552
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Feb 2020 09:55:39 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 85E893C17C4
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:55:38 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 32DA81401985
 for <ltp@lists.linux.it>; Tue, 18 Feb 2020 09:55:37 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 903D0ACCE;
 Tue, 18 Feb 2020 08:55:37 +0000 (UTC)
Date: Tue, 18 Feb 2020 09:55:36 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Li Wang <liwang@redhat.com>
Message-ID: <20200218085536.GB25228@dell5510>
References: <CAEemH2dEco268yqDyDjX25FPs3V7wTBija4HiMrf8nr0W7qVQQ@mail.gmail.com>
 <20200217141622.26912-1-mdoucha@suse.cz>
 <20200217141622.26912-2-mdoucha@suse.cz>
 <CAEemH2fvquWe_+-Au-Z0wRaYt0V943A1zszJVPCXO6HrLWH9Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEemH2fvquWe_+-Au-Z0wRaYt0V943A1zszJVPCXO6HrLWH9Yg@mail.gmail.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 2/3] Split off executable code from
 bpf/bpf_common.h
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

> May I ask why we need to reserve these *.o binary files in the compiling?

> # ls
> bpf_common.c  bpf_common.o  bpf_map01.c  bpf_prog01    bpf_prog01.o
>  bpf_prog02.c  bpf_prog03    bpf_prog03.o
> bpf_common.h  bpf_map01     bpf_map01.o  bpf_prog01.c  bpf_prog02
>  bpf_prog02.o  bpf_prog03.c  Makefile


> Otherwise, the patchset looks good.
>     Acked-by: Li Wang <liwang@redhat.com>

Reviewed-by: Petr Vorel <pvorel@suse.cz>
(+1 for Li change to Makefile).

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
