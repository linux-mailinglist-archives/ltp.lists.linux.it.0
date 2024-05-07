Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E92E8BE6F6
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2024 17:07:49 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B79483CDD2A
	for <lists+linux-ltp@lfdr.de>; Tue,  7 May 2024 17:07:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6CFD33CDB5E
 for <ltp@lists.linux.it>; Tue,  7 May 2024 17:07:39 +0200 (CEST)
Authentication-Results: in-6.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz
 (client-ip=195.135.223.130; helo=smtp-out1.suse.de;
 envelope-from=pvorel@suse.cz; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7B8FE14016EE
 for <ltp@lists.linux.it>; Tue,  7 May 2024 17:07:38 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E492340C4;
 Tue,  7 May 2024 15:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1715094457;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xc2k+UxPW7zW4gDl4QmFpj/inPHxPLoq4b8Cec3MXoo=;
 b=OL2IcTyYUAKbMJQIhPm8RtF6K28owCm+/qsKNDKPer4zwRSiOoSjXSTOqGH9sK0cTmFLE0
 0w7x3BHcVtC8mCIoDrd4litYUEPTf4odhjp5FC4JsYQVknqcOcT5mlq/KT7VuXBcqr5LYy
 KY0nZv7pUPIWPUqiDxfuk30+Xc0vuBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1715094457;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xc2k+UxPW7zW4gDl4QmFpj/inPHxPLoq4b8Cec3MXoo=;
 b=rMl86ei605EDkOJGq4Qp6cXRVb3YgAlp3KunkwY2Yjuh4ZA3d1Y2ew+NnmZr8RzZegOgZZ
 +dOvqoKaUOcdp5CQ==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=OL2IcTyY;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=rMl86ei6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1715094457;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xc2k+UxPW7zW4gDl4QmFpj/inPHxPLoq4b8Cec3MXoo=;
 b=OL2IcTyYUAKbMJQIhPm8RtF6K28owCm+/qsKNDKPer4zwRSiOoSjXSTOqGH9sK0cTmFLE0
 0w7x3BHcVtC8mCIoDrd4litYUEPTf4odhjp5FC4JsYQVknqcOcT5mlq/KT7VuXBcqr5LYy
 KY0nZv7pUPIWPUqiDxfuk30+Xc0vuBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1715094457;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Xc2k+UxPW7zW4gDl4QmFpj/inPHxPLoq4b8Cec3MXoo=;
 b=rMl86ei605EDkOJGq4Qp6cXRVb3YgAlp3KunkwY2Yjuh4ZA3d1Y2ew+NnmZr8RzZegOgZZ
 +dOvqoKaUOcdp5CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 599B9139CB;
 Tue,  7 May 2024 15:07:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap1.dmz-prg2.suse.org with ESMTPSA id LhmtFLlDOmbyTAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Tue, 07 May 2024 15:07:37 +0000
Date: Tue, 7 May 2024 17:07:35 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <20240507150735.GB145556@pevik>
References: <20240506212734.71279-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240506212734.71279-1-pvorel@suse.cz>
X-Spam-Score: -3.62
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 7E492340C4
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-3.62 / 50.00]; BAYES_HAM(-2.91)[99.60%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_RHS_NOT_FQDN(0.50)[];
 HAS_REPLYTO(0.30)[pvorel@suse.cz];
 R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MX_GOOD(-0.01)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; TO_DN_SOME(0.00)[]; MIME_TRACE(0.00)[0:+];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
 RCVD_TLS_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 FROM_EQ_ENVFROM(0.00)[]; FROM_HAS_DN(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_VIA_SMTP_AUTH(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; MISSING_XM_UA(0.00)[];
 DKIM_TRACE(0.00)[suse.cz:+]; REPLYTO_EQ_FROM(0.00)[]
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 1/1] ci: Add spinx related job
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

Hi all,

...
> +jobs:
> +  sphinx:
> +    runs-on: ubuntu-latest
> +    steps:
> +      - name: Checkout LTP
> +        uses: actions/checkout@v2
> +        with:
> +          path: ltp
> +
> +      - name: Install spinx
Ah, typo here and in the subject:
s/spinx/sphinx


> +        run: |
> +          sudo apt update
> +          sudo apt install python3-sphinx python3-virtualenv
> +
> +      - name: Install spinx dependencies
And here as well.

Tested fixed branch:
https://github.com/pevik/ltp/actions/runs/8987761091

I'd like to merge soon, so that we have testing before doing more doc updates.

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
