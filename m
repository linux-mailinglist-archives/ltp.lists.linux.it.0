Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9EB67EE24
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jan 2023 20:27:52 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 00FFE3CEB21
	for <lists+linux-ltp@lfdr.de>; Fri, 27 Jan 2023 20:27:52 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 4E3B23CE938
 for <ltp@lists.linux.it>; Fri, 27 Jan 2023 20:27:50 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B204E1A01190
 for <ltp@lists.linux.it>; Fri, 27 Jan 2023 20:27:49 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BDB2F1FD6C;
 Fri, 27 Jan 2023 19:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1674847668;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRjI/KB6yW+SRnbNDdbvbEorkyKvKrk2KzJwdhckYz8=;
 b=dH7mlMmZ5C6+VzejPZOEfqZSHtPnyHTj1sRruY7BITXosH6hfSaz4zqhxKknreOhymcqAP
 xtIKye1ZZLhsqQtHL/CxzlAiT7T0QS7wfcG8NQxVbrQbuqtUXUnear4yrYYUfuznJjuR7c
 +nf9WUS+ILneZrcprklwEXRwLoOcXp0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1674847668;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iRjI/KB6yW+SRnbNDdbvbEorkyKvKrk2KzJwdhckYz8=;
 b=cA0PZPHoEsewYCMg/2uPWtVcwGokZQ3MmCSC2cKddz0kSiPMz6QfxbH6Qlrtp6v8q1cBld
 yjl3YggsZSw7lKCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 760471336F;
 Fri, 27 Jan 2023 19:27:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iTHPF7Ql1GPUWwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Fri, 27 Jan 2023 19:27:48 +0000
Date: Fri, 27 Jan 2023 20:27:46 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>, ltp@lists.linux.it
Message-ID: <Y9QlsoaGfxEppV5y@pevik>
References: <20230117181657.20932-1-pvorel@suse.cz> <873585s3lj.fsf@suse.de>
 <Y9BIDjdcEBuaTbDs@pevik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9BIDjdcEBuaTbDs@pevik>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] containers: Remove setns_check
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

Hi Richie,

merged!
Thanks for your review!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
