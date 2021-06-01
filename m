Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2D2396FCF
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:03:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1BC343C801C
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 11:03:57 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 70CB73C5592
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:03:52 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 8366A1A01118
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 11:03:51 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 00E832191F;
 Tue,  1 Jun 2021 09:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622538231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrGRpk87/5y0DykelLAL5TiJOcKlPrOnuU1gmgqEsb8=;
 b=mkOZTtpQarsitLilPEoFfizvb2Tgbm10C57ikTo5BDtGZPbIJltb6O4meiznAGe8NLQDdk
 LrJ4j5QKoLsfxbq7Kuwar9T8MV7eNL0vuQYNxUk5ZxQqNnjkgbwH2rlVkljo6X75nf2Ieq
 +uG5f0S1WwIwQ/8gyfPmnv+YijPVTVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622538231;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrGRpk87/5y0DykelLAL5TiJOcKlPrOnuU1gmgqEsb8=;
 b=NJwcoNqFdfSKlv/s0IKpf4AQ3O2/XOsO1OdAq/vfcymXkPdMfjIKaQpgS94GXF4qRC6bzu
 fzCjrXge1QnEsQCQ==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id B7901118DD;
 Tue,  1 Jun 2021 09:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622538230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrGRpk87/5y0DykelLAL5TiJOcKlPrOnuU1gmgqEsb8=;
 b=z7ZPqHHaT4TzAGsDw3QmNwmI4ET5NN/4b5IEyL/6ms5jR7dtLr6I4gGCuPpSRnh0uyNtnA
 4CshjbK0YPxTXEdiU0RTFce2M+MzNFWbJFALwNv2js92T4AbPFkpn8ek4n5m4te6T7SHUC
 bXIQIr10mfJ+ZcAi4EgBk29SNK6OW/g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622538230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LrGRpk87/5y0DykelLAL5TiJOcKlPrOnuU1gmgqEsb8=;
 b=1SPWRT2DrzzmfmkACDgbFiQ4irMUvtcq3UA7mfy/v5C/88wp4BThzG5S4AXLmL4oOpaL86
 ogtV0eEXw1vlJ9CQ==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Np0ALPb3tWBGXAAALh3uQQ
 (envelope-from <mdoucha@suse.cz>); Tue, 01 Jun 2021 09:03:50 +0000
To: Petr Vorel <pvorel@suse.cz>, Alexey Kodanev <aleksei.kodanev@bell-sw.com>
References: <20210531135314.5067-1-mdoucha@suse.cz>
 <f8300887-b372-950e-5c26-92ba36869246@bell-sw.com> <YLX3Qyah6SLQTKzW@pevik>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <03481451-41a5-7dc0-c675-fa622c7bcd6b@suse.cz>
Date: Tue, 1 Jun 2021 11:03:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <YLX3Qyah6SLQTKzW@pevik>
Content-Language: en-US
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: -1.00
X-Spamd-Result: default: False [-1.00 / 100.00]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_THREE(0.00)[3]; TO_DN_SOME(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 NEURAL_HAM_SHORT(-1.00)[-1.000]; RCVD_NO_TLS_LAST(0.10)[];
 FROM_EQ_ENVFROM(0.00)[]; MIME_TRACE(0.00)[0:+];
 RCVD_COUNT_TWO(0.00)[2]; MID_RHS_MATCH_FROM(0.00)[]
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.5 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/2] network/busy_poll: Fix tests in namespaced env
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

On 01. 06. 21 11:00, Petr Vorel wrote:
>> Here should be net.core.busy_poll, not the path.
> Hi Alexey, Martin,
> 
> Yep, I was just going to report it as well.
> 
> Merging both patches with this fix, thanks both for your time!

Sorry about that and thanks for the fix.

-- 
Martin Doucha   mdoucha@suse.cz
QA Engineer for Software Maintenance
SUSE LINUX, s.r.o.
CORSO IIa
Krizikova 148/34
186 00 Prague 8
Czech Republic

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
