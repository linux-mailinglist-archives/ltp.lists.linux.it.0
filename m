Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C25D94087D8
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 11:12:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 849603C8A85
	for <lists+linux-ltp@lfdr.de>; Mon, 13 Sep 2021 11:12:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95B1F3C1DD3
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 11:12:25 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id C8D76600654
 for <ltp@lists.linux.it>; Mon, 13 Sep 2021 11:12:24 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 22FAA21E87;
 Mon, 13 Sep 2021 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1631524344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2GP0OE1c1MSUMPaFPBk8a9ei5T1t6arvUhUB6TKMSA=;
 b=Wz3buVEgLhfcAD/AfXE9QOYaoycIhZQJtlubavusM+P1OQm6zzYzO0yaVha8frExRdlEO+
 Ui+0CFIfeR9HpYnxL6HABxokoAPS/1tVMwdnFVohoDN3iqafLLFjrAc45T1Zl3uqDF0zD2
 Oyg7vk55AX1Y3xdN1DBvXByGqOxjN6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1631524344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s2GP0OE1c1MSUMPaFPBk8a9ei5T1t6arvUhUB6TKMSA=;
 b=heL6PDvABLeuTTZCxSDrtmeZEZ7Fiu4vTCEn3Ijp4rZM8/SlmE5jNzN8r0Co3cWMhzPDEl
 ouYcl0sd2IGrXOBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0832E132AB;
 Mon, 13 Sep 2021 09:12:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id b7ekAPgVP2EtHQAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Mon, 13 Sep 2021 09:12:24 +0000
Message-ID: <6335b5af-908f-e2be-8f79-f109a2ba5c45@suse.cz>
Date: Mon, 13 Sep 2021 11:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.1
Content-Language: en-US
To: Cyril Hrubis <chrubis@suse.cz>, pvorel <pvorel@suse.de>
References: <20210909155126.2720-1-mdoucha@suse.cz>
 <20210909155126.2720-8-mdoucha@suse.cz>
 <287a9879ef8b3342cb88225e4e319733@suse.de> <YTtrwkSdUaQE/PnB@yuki>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <YTtrwkSdUaQE/PnB@yuki>
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-1.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 8/8] syscalls/setresuid03: Convert to new API
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

On 10. 09. 21 16:29, Cyril Hrubis wrote:
> Hi!
>> It's a second test where we could use TST_EXP_FAIL_SILENT() if we had it 
>> defined.
> 
> Well the main point we test is that the call fails so I would just use
> TST_EXP_FAIL() that produces TPASS/TFAIL and the have additional check
> if the groups were changed or not.
> 
> I can change the patche accordingly before applying if you agree.

I didn't use TST_EXP_FAIL() intentionally in order to have the same test
output as with TST_EXP_PASS_SILENT(). But I can use TST_EXP_FAIL() as
well. The final UID/GID check needs some changes too so I'll resubmit.

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
