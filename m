Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 790AB4D9FB4
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Mar 2022 17:14:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4391D3C9338
	for <lists+linux-ltp@lfdr.de>; Tue, 15 Mar 2022 17:14:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 2599C3C0EA4
 for <ltp@lists.linux.it>; Tue, 15 Mar 2022 17:14:05 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 79649600774
 for <ltp@lists.linux.it>; Tue, 15 Mar 2022 17:14:04 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9680F210F0;
 Tue, 15 Mar 2022 16:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1647360844; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jglIVhy72BicLfPJg3xmnzqLOkqarywU0rKyAN/l1fc=;
 b=Ea84R1487Wu5nqYBKL+CmiWVS33XI+SDsh4blFuTDrdhCsiE6MEZQDC+Le67PaQuGDpTGz
 0lFAVPDoHGCNavAEQo7vuuGC59jq8yYq7kfkIajsTu2/A+AVkQb6B8T1t1RKki8IVrQ7bZ
 +Xg1Uex/ViRXMXUS1ksnY/xL7KAOpo8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1647360844;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jglIVhy72BicLfPJg3xmnzqLOkqarywU0rKyAN/l1fc=;
 b=USptj41VIYweqLacpFOuMHqrzMX2GcsEuzXhNGFV7OP7SFWfoN2C9noLLgFbNPpV7Bnl0k
 l4bn4rwOOeolpoDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75C1213B4E;
 Tue, 15 Mar 2022 16:14:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id drqMG0y7MGKwOgAAMHmgww
 (envelope-from <mdoucha@suse.cz>); Tue, 15 Mar 2022 16:14:04 +0000
Message-ID: <dd1485f7-1f0d-3360-451f-99656b0fbe9d@suse.cz>
Date: Tue, 15 Mar 2022 17:14:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
To: rpalethorpe@suse.de
References: <20220309164954.23751-1-mdoucha@suse.cz>
 <20220309164954.23751-2-mdoucha@suse.cz> <87o8275lbi.fsf@suse.de>
 <f7972d11-de50-d9bc-3abc-dcba53dc3936@suse.cz> <87fsnj5hi9.fsf@suse.de>
From: Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <87fsnj5hi9.fsf@suse.de>
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] Add test for CVE 2021-38198
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

On 15. 03. 22 16:44, Richard Palethorpe wrote:
> Martin Doucha <mdoucha@suse.cz> writes:
>> So somebody will have to revert the fix and run the test on
>> custom kernel to answer that question.
> 
> Did you reproduce the bug?
> 
> I could try this next week.

Yes, I've verified the reproducer on older SLE-12SP5 and SLE-15SP3
kernels. But none of them currently have the tdp_mmu sysfile so the test
had to use the Intel/AMD KVM module reload fallback.

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
