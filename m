Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 840084B848A
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 10:36:55 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 54AE43CA07A
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Feb 2022 10:36:55 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 7853D3C9B68
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 10:36:53 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id DF186601000
 for <ltp@lists.linux.it>; Wed, 16 Feb 2022 10:36:52 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 391FF1F394;
 Wed, 16 Feb 2022 09:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645004212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjwA6nu95/9sZrt6K7s7bXLY2pI4pIqXYS38t8XjaZk=;
 b=e+QZwLwwNKNAAUsXWaEPdUhR1i0KpqpZNY7xnwIVs4ljgwY9e94emZ73lH7iFSMvWwQ95K
 5GsXPSrqArg3XAsUSx5+2sxYqLkGt4iPhfur0oVUl++LE8iiS8JOGoMvi6Mnzw7foza5Cl
 P4h39fYeBRuXdMlf+7Mi7Z3KNpUA2zY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645004212;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GjwA6nu95/9sZrt6K7s7bXLY2pI4pIqXYS38t8XjaZk=;
 b=OCd0jLiI0tQp5vWBNufXettFIz9FX827sZ9v1Nv7oDSLoYL+f1Dcjx0Un4RNasT05SFJHf
 /3I7Ti8iqKHfcsCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 31AE713A9F;
 Wed, 16 Feb 2022 09:36:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1y31C7TFDGJocwAAMHmgww
 (envelope-from <blezhepekov@suse.de>); Wed, 16 Feb 2022 09:36:52 +0000
MIME-Version: 1.0
Date: Wed, 16 Feb 2022 11:36:51 +0200
From: blezhepekov <blezhepekov@suse.de>
To: Petr Vorel <pvorel@suse.cz>
In-Reply-To: <YgzDPl1u6Nr9YqYI@pevik>
References: <20220216090708.29588-1-blezhepekov@suse.de>
 <YgzDPl1u6Nr9YqYI@pevik>
User-Agent: Roundcube Webmail
Message-ID: <9eb2b9ccd6323684b2ce7916e0be5572@suse.de>
X-Sender: blezhepekov@suse.de
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v1] ltpfs/main.c: Initialize return variable
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 2022-02-16 11:26, Petr Vorel wrote:
> Hi Bogdan,
> 
>> LTP_fs_open_block_device returned initialized local
>                                     ^ uninitialized ?
> 
>> variable, when device handler is occupied.
> 
> Reviewed-by: Petr Vorel <pvorel@suse.cz>
> LGTM.
> 
> Kind regards,
> Petr
Oops, it's a typo. Obviously should be "uninitialized".

Want me to submit an update?

-Bogdan

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
