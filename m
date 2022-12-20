Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 689C965225A
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Dec 2022 15:22:45 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1EBE63C8C6C
	for <lists+linux-ltp@lfdr.de>; Tue, 20 Dec 2022 15:22:45 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AF9D33C1769
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 15:22:41 +0100 (CET)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 3FCE7140074D
 for <ltp@lists.linux.it>; Tue, 20 Dec 2022 15:22:40 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7178B7634A;
 Tue, 20 Dec 2022 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1671546160;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zT1TtLrjc3KqK5JoVUGTRC2s/oG7JDbfJVbd6AWo5c4=;
 b=WvCPZkdZBt3baclFT8kMHmZ5/jZfURFC+tTZtqrMIDgxWIxZUpIAP6i2VHcAANanBawh3B
 HenlZcN4hC4W7gmM5YzFUKsO+ysccZ4RNI9WBlL7FbBnAyDNFWu6izgjbOD6aNs1dpo1hS
 FSktTanjNQ72PUvct8jqKb3hb+qFfO8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1671546160;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zT1TtLrjc3KqK5JoVUGTRC2s/oG7JDbfJVbd6AWo5c4=;
 b=lS2IR+12GUS34mbjSEdMveeg85gtQsvZLmEIahmV9RpMnpnmTySfTStDruztd2xrv6YkvL
 6Pv6z7SBj8I0S4AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3EC391390E;
 Tue, 20 Dec 2022 14:22:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Mg+nDTDFoWNILgAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 20 Dec 2022 14:22:40 +0000
Date: Tue, 20 Dec 2022 15:22:38 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Andrea Cervesato <andrea.cervesato@suse.com>
Message-ID: <Y6HFLu3vkOJVMBwn@pevik>
References: <20221220124351.5001-1-andrea.cervesato@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221220124351.5001-1-andrea.cervesato@suse.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-6.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] Add runltp-ng to upstream
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

Hi all,

> runltp-ng is the next generation runner for Linux Testing Project and it
> will replace the current obsolete runltp script in the next future.

changes v1->v2
* repository moved to LTP github namespace

> Signed-off-by: Andrea Cervesato <andrea.cervesato@suse.com>
> ---
>  .gitmodules     | 3 +++
>  tools/runltp-ng | 1 +
>  2 files changed, 4 insertions(+)
>  create mode 160000 tools/runltp-ng

> diff --git a/.gitmodules b/.gitmodules
> index a3c34af4b..810eac395 100644
> --- a/.gitmodules
> +++ b/.gitmodules
> @@ -4,3 +4,6 @@
>  [submodule "tools/sparse/sparse-src"]
>  	path = tools/sparse/sparse-src
>  	url = git://git.kernel.org/pub/scm/devel/sparse/sparse.git
> +[submodule "tools/runltp-ng"]
> +	path = tools/runltp-ng
> +	url = git@github.com:linux-test-project/runltp-ng.git
Wouldn't be better to use https ?

-	url = git@github.com:linux-test-project/runltp-ng.git
+	url = https://github.com/linux-test-project/runltp-ng.git

Or are there problems with certificates? If agree on https,
we of course should migrate other

Otherwise LGTM

Acked-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr

> diff --git a/tools/runltp-ng b/tools/runltp-ng
> new file mode 160000
> index 000000000..af20a864e
> --- /dev/null
> +++ b/tools/runltp-ng
> @@ -0,0 +1 @@
> +Subproject commit af20a864ec01674ce4f5a21d3308dc3a76da9303

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
