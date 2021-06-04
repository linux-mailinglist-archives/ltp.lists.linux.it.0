Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D37639B50C
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 10:42:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9D4463C4EE7
	for <lists+linux-ltp@lfdr.de>; Fri,  4 Jun 2021 10:42:41 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 080423C0926
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 10:42:39 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 51DE510011CF
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 10:42:39 +0200 (CEST)
Received: from relay2.suse.de (unknown [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 40DAE219F8
 for <ltp@lists.linux.it>; Fri,  4 Jun 2021 08:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1622796158;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sj+/qKG6w14JolZsn4VyMF/28ecO7guXVRWb0CetgiA=;
 b=AYq9ntHyfEO+ElTUtQ15+pjqpKzkx9xi1KMSfdQBKQCUGb0Y0k9POv8oIbQo7FgazTNi1N
 GfBgxyceKe1P6wpWpIld5sy2D19R3DhJ3uAHnrBh1CFZh5FGstzOKfTV739VnmmirWtUi9
 xZ6gX8C8V6hMNm5il38k8DEDbfIqsh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1622796158;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sj+/qKG6w14JolZsn4VyMF/28ecO7guXVRWb0CetgiA=;
 b=lAnETxNNpY8/3F06jR8aFnv6CFNA09S+i5/TWRVXVVPH4swrhpL+WcPJexPlHWDrZy2tPJ
 JvQ0bZYPRasVeJCA==
Received: from g78 (unknown [10.163.24.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 12854A3B88;
 Fri,  4 Jun 2021 08:42:38 +0000 (UTC)
References: <20210603154825.30165-1-rpalethorpe@suse.com>
 <20210603154825.30165-2-rpalethorpe@suse.com> <YLnC05icNAshbXtr@pevik>
 <YLnERhx/f8evU0uQ@pevik>
User-agent: mu4e 1.4.15; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-reply-to: <YLnERhx/f8evU0uQ@pevik>
Date: Fri, 04 Jun 2021 09:42:37 +0100
Message-ID: <878s3qja0y.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [RFC PATCH 1/2] Add 'make checks' and clang-checks to
 build system
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello,

Petr Vorel <pvorel@suse.cz> writes:

> Hi Richie,
>
>> Hi Richie,
>
>> > Allows the user to run 'make check' to check all source files or
>> > 'make check-<target>' to check one source file corresponding to a
>> > target.
>
>> > Adds makefile pieces for tools/clang-checks/main which will be a
>> > libclang based tool. By default this is ran by 'make check'.
>
>> Compilation does not work from tools directory:
>
>> $ cd tools/ && make
>> ../include/mk/testcases.mk:25: ../include/mk/clang-checks.mk: No such file or directory
>> make: *** No rule to make target '../include/mk/clang-checks.mk'.  Stop.
>
> I guess you forget to add git add include/mk/clang-checks.mk, right?

Argg, yes, sorry for wasting your time. This is my fault for not
cleaning up my LTP directory.

>
> Kind regards,
> Petr


-- 
Thank you,
Richard.

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
