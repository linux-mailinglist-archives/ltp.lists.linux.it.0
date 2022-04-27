Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F53511327
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Apr 2022 10:04:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id A08BC3CA502
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Apr 2022 10:04:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A522F3C8977
 for <ltp@lists.linux.it>; Wed, 27 Apr 2022 10:04:14 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 3E4741A0089B
 for <ltp@lists.linux.it>; Wed, 27 Apr 2022 10:04:13 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 64C69210E3;
 Wed, 27 Apr 2022 08:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1651046653;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LR9+EZY+/3oJ4Qx9/XgGxW2RipAq+NJQYcNirOaPBbY=;
 b=Hsvr8c/1QDwy6ui0tOmK6NRXsER/8h52gHwFuZNOy5eNhDWkBp2npQUoDCmGdN9464NNiU
 xDNESPsfoD/MmKpGBBy0DCcMYvh/gvfzkcno41vWErzImy6G5amH8xrlrbXHTZ/VTXv11h
 1IP8YLv73/X9tGgrR7eWRHe2bSHapN4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1651046653;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LR9+EZY+/3oJ4Qx9/XgGxW2RipAq+NJQYcNirOaPBbY=;
 b=d4zgKbCLJoaZ6DVblEGTn2DEO8OoGtwF2LXN/cCyl8/6fQdOvBJhKo826zKYfZXWUR84uZ
 2WUC22ZOTAh3NhBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 42E151323E;
 Wed, 27 Apr 2022 08:04:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 17CJDv34aGILOQAAMHmgww
 (envelope-from <pvorel@suse.cz>); Wed, 27 Apr 2022 08:04:13 +0000
Date: Wed, 27 Apr 2022 10:04:11 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <Ymj4+x3b2GyD1NFK@pevik>
References: <20220422144141.16848-1-pvorel@suse.cz>
 <20220422144141.16848-3-pvorel@suse.cz>
 <630fbde9-45f7-3a8d-15e0-1ac94c45ece1@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <630fbde9-45f7-3a8d-15e0-1ac94c45ece1@suse.cz>
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 2/4] doc: Update library API doc
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

Hi Martin,

...
> > +3.1 Shell libraries
> > +~~~~~~~~~~~~~~~~~~~
> > +
> > +Besides shell API libraries in 'testcases/lib' it's worth to put common code
> > +for particular tests into shell library. The filename should end '_lib.sh',
> > +they should load 'tst_test.sh' or 'tst_net.sh'.

> Better wording:
> Aside from shell API libraries in 'testcases/lib', it's worth putting
> common code for a group of tests into a shell library. The filename
> should end with '_lib.sh' and the library should load 'tst_test.sh' or
> 'tst_net.sh'.

+1, thank you!
I'll fix it before merge.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
