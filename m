Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D02F06656D6
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Jan 2023 10:04:51 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 7B6F63CB562
	for <lists+linux-ltp@lfdr.de>; Wed, 11 Jan 2023 10:04:51 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3D3543CB551
 for <ltp@lists.linux.it>; Wed, 11 Jan 2023 10:04:49 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 942CC1000417
 for <ltp@lists.linux.it>; Wed, 11 Jan 2023 10:04:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E7A65768EC;
 Wed, 11 Jan 2023 09:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1673427886;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VpiaL2mVsHOo95RHYAm/49wHQhZXabCJ5D9kSh8uQVo=;
 b=zr3DZdFiKjuSwqwGcRgxbS+AIFvl7fhsLXr+r9eqMCfKB6T03uLxvgrj73zH+X/k0qkW6P
 477l0os3XSXrO58G8KZl6liRw58FQFrLo5JEW8fNaJhIlOBw4BRBp6cObOAFqs/v/9ID7i
 XyyUpYLCIMdoqxtpO1RccmcykHttmQ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1673427886;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VpiaL2mVsHOo95RHYAm/49wHQhZXabCJ5D9kSh8uQVo=;
 b=RVDZzyr6L9ywlqqyqtFktjAO4ju85+BpQAm+3kM7bOxIji3ZLfa8Cu6GIx9BkUxIxc4SJ8
 +YhOE353SCk/XiBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C09C813591;
 Wed, 11 Jan 2023 09:04:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M3K6La57vmMuWAAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 11 Jan 2023 09:04:46 +0000
Date: Wed, 11 Jan 2023 10:04:40 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Richard Palethorpe <rpalethorpe@suse.de>
Message-ID: <Y757qIWOX1nyd7lC@pevik>
References: <20221216114331.28883-1-pvorel@suse.cz> <Y5xaew0XH0mE3DZw@pevik>
 <877cxwj7c2.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <877cxwj7c2.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_SOFTFAIL
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] aio-stress: TCONF on O_DIRECT on tmpfs
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

Hi Richie,

> I merged this, although I don't think it is quite correct to say tmpfs
> doesn't support O_DIRECT. It's more like it is in O_DIRECT mode by
> default. Either way though we don't need to run the test with O_DIRECT
> and without it.

NOTE: feel free to correct me (amend the message) before merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
