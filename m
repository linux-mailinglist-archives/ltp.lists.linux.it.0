Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC8C3F5DAF
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:11:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 104313C31F2
	for <lists+linux-ltp@lfdr.de>; Tue, 24 Aug 2021 14:11:32 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D2CA33C30C9
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:11:28 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D7462200C79
 for <ltp@lists.linux.it>; Tue, 24 Aug 2021 14:11:27 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0978B20058;
 Tue, 24 Aug 2021 12:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1629807087;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TqKP/ibKf5MQ66ixUeV/QHNH1vK7eI3CJ9l/XR1Wkgc=;
 b=OwqIGRnYGmzPqEK1E0HS23BSFWVKBvsZLSfYpMrMIynNNVk4nBO7asJqo+VfG/hPMGfVfJ
 Z/hLfYwg8InxhoGniwTCoVYllzyKTq0EHUPaaoLFbsZZiIcamD0hTVpTGyvDvWnUUm5QgY
 IGtcVmbrARt9fP/kYqZM4OahMhs3PWs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1629807087;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TqKP/ibKf5MQ66ixUeV/QHNH1vK7eI3CJ9l/XR1Wkgc=;
 b=/6IxCHGSrZxtKVqPGyVMXJ40kjbrhC6xOVayC0AG+R9QtL7ol9rdZOMLS+yUuLKbdHjqKI
 NMd2O/QcoXywS0AQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id D7F3213A50;
 Tue, 24 Aug 2021 12:11:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 6572Mu7hJGEnJAAAGKfGzw
 (envelope-from <pvorel@suse.cz>); Tue, 24 Aug 2021 12:11:26 +0000
Date: Tue, 24 Aug 2021 14:11:24 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Alexey Kodanev <aleksei.kodanev@bell-sw.com>
Message-ID: <YSTh7DeKY5J0SSyv@pevik>
References: <20210804120446.32835-1-aleksei.kodanev@bell-sw.com>
 <20210804120446.32835-2-aleksei.kodanev@bell-sw.com>
 <YR+HXE01R1RE8TTH@pevik>
 <48500320-6cc6-591a-fc3d-708e88fd8640@bell-sw.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48500320-6cc6-591a-fc3d-708e88fd8640@bell-sw.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/3] network/tst_net.sh: fix busybox/sysctl in
 tst_set_sysctl()
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

Hi Alexey,

..
> >> -	tst_net_run $safe $rparam "sysctl -q -w $name=$value"
> >> +	tst_net_run $safe $rparam "sysctl -q -w" "$name=$value"

> > I wonder if it were a bit clearer if we moves all params to second arg:
> > 	tst_net_run $safe "sysctl" "$name=$value -q -w"

> OK, but changed to "sysctl" "-q -w $name=$value" because the other
> options should also be placed before the key/value pair:

>     Usage: sysctl -p [-enq] [FILE...] / [-enqaw] [KEY[=VALUE]]...
Thanks for addressing it!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
