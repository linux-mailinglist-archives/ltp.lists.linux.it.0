Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 23B02B51250
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Sep 2025 11:21:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 956AC3CD7B9
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Sep 2025 11:21:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6441D3C2472
 for <ltp@lists.linux.it>; Wed, 10 Sep 2025 11:21:35 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EC412600838
 for <ltp@lists.linux.it>; Wed, 10 Sep 2025 11:21:34 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1AAB0371F6;
 Wed, 10 Sep 2025 09:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1757496094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fUzSciTzU+Bw/uTo1oiX4leeC7jofjUCi52/NvpF8Oo=;
 b=FUJBcjwi13PuX+reEUX9HHQzx1T2myd2OkgrxSdRGpmrbGNBEfblYAMesx5Zav5ArUKfXQ
 DoTKqE0EWnSnfdrQws1PrnNaFLrNFKa1yix/DGLOzd1OGwUNPH/P4MQBipMUYaZ7AvBfWU
 OpOv8OpE+0jzp+WeNvd+lgn47e6MIWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1757496094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fUzSciTzU+Bw/uTo1oiX4leeC7jofjUCi52/NvpF8Oo=;
 b=G2YGPqN0LUOIlTxUASGwW/TVYlsPvy2QIrrtokiaHhAX2x6v+D0ZWk3zpuVU8AHSGKYeND
 6+wdlQcACNINa6Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1757496094; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fUzSciTzU+Bw/uTo1oiX4leeC7jofjUCi52/NvpF8Oo=;
 b=FUJBcjwi13PuX+reEUX9HHQzx1T2myd2OkgrxSdRGpmrbGNBEfblYAMesx5Zav5ArUKfXQ
 DoTKqE0EWnSnfdrQws1PrnNaFLrNFKa1yix/DGLOzd1OGwUNPH/P4MQBipMUYaZ7AvBfWU
 OpOv8OpE+0jzp+WeNvd+lgn47e6MIWo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1757496094;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fUzSciTzU+Bw/uTo1oiX4leeC7jofjUCi52/NvpF8Oo=;
 b=G2YGPqN0LUOIlTxUASGwW/TVYlsPvy2QIrrtokiaHhAX2x6v+D0ZWk3zpuVU8AHSGKYeND
 6+wdlQcACNINa6Cg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 05B4913301;
 Wed, 10 Sep 2025 09:21:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id UM1FAB5DwWj8PQAAD6G6ig
 (envelope-from <chrubis@suse.cz>); Wed, 10 Sep 2025 09:21:33 +0000
Date: Wed, 10 Sep 2025 11:22:13 +0200
From: Cyril Hrubis <chrubis@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <aMFDRf8cbpoCnkEK@yuki.lan>
References: <20250822135702.23337-1-mdoucha@suse.cz>
 <CAEemH2eGMFOns37ho9sfpXKJhua0Vd+zWdohG_y9BY++=A9OUw@mail.gmail.com>
 <cf84786a-8796-4843-835f-e9b7499802c4@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cf84786a-8796-4843-835f-e9b7499802c4@suse.cz>
X-Spam-Level: 
X-Spamd-Result: default: False [-4.30 / 50.00]; BAYES_HAM(-3.00)[99.99%];
 NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-0.999]; MIME_GOOD(-0.10)[text/plain];
 ARC_NA(0.00)[]; MIME_TRACE(0.00)[0:+]; MISSING_XM_UA(0.00)[];
 TO_DN_SOME(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCVD_TLS_ALL(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 FROM_EQ_ENVFROM(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -4.30
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] aio_cancel_7-1: Write into a socket
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
Martin are you going to send v4 soon enough so that we can include it in
the release?

-- 
Cyril Hrubis
chrubis@suse.cz

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
