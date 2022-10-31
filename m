Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F87613970
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 15:56:28 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BB69F3CAC4B
	for <lists+linux-ltp@lfdr.de>; Mon, 31 Oct 2022 15:56:27 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 8ADB03C2A0E
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 15:56:24 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 1FE8F1A007EB
 for <ltp@lists.linux.it>; Mon, 31 Oct 2022 15:56:23 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 744EA1F8BF;
 Mon, 31 Oct 2022 14:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1667228183;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xy2BFdtSMQu7+3yFdGMbRqBNhoao+VbAi0A7xJCvAI8=;
 b=3I8Y4KarTTs4tme1unBSS9iWKo7afNxzoo8c8Vk1j2cCyUu2GrV6VRIq57vzBZopJ0ZJ2w
 ss39rk6mVrvtB2xXfzmyfKHbV0dWyrmBr5Prr4QEet183pJQXuHn66a+3FYXuLey8PrnRa
 OqSZdsKosaGEMAjBDcFfccPULbY1pC8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1667228183;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xy2BFdtSMQu7+3yFdGMbRqBNhoao+VbAi0A7xJCvAI8=;
 b=LF8kq70b6qRGkxCHkzliDvR1a97EuElZ6Cirh4QB0lzpOYsfzdYZMAVYaGxcoRazQuQykE
 BjDaxIOfB5UGsrDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 44E1A13451;
 Mon, 31 Oct 2022 14:56:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hcAPDxfiX2PuCwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Mon, 31 Oct 2022 14:56:23 +0000
Date: Mon, 31 Oct 2022 15:56:20 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Y1/iFIltC2RXfDpl@pevik>
References: <20221027140954.4094-1-akumar@suse.de> <Y1+zeo9kmWOl2yE3@pevik>
 <ad63ddb5-b443-c0ee-fb1b-748bded5f151@suse.cz>
 <Y1/SkicyE3Mg9Fpc@pevik>
 <96b14089-f1bb-e634-d74b-75fe92e58efa@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96b14089-f1bb-e634-d74b-75fe92e58efa@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] setfsuid02: using -1 as invalid fsuid for
 setfsuid()
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

> On 31. 10. 22 14:50, Petr Vorel wrote:
> > > No, UID16_CHECK(invalid_uid, setfsuid); is the correct test call. The test
> > > is supposed to verify that trying to set invalid_uid will fail, and the only
> > > way to verify that it failed is to call setfsuid(invalid_uid) again and
> > > check that it returns current_uid.
> > I'm somehow blind today. UID16_CHECK() in compat_tst_16.h calls
> > UID_SIZE_CHECK(), which just checks the uid value. I don't see setfsuid() call,
> > IMHO that's done in SETFSUID().

> It doesn't make sense to call UID16_CHECK() on a value that we'll never pass
> to a 16bit syscall, does it?
Ah, sure, I see current_uid is used for checking only. So what is your
suggestion to fix the problem on 16-bit?

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
