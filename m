Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 841993E5E43
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 16:45:45 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B3AE3C70B1
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Aug 2021 16:45:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1A5A53C4C15
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 16:45:42 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 6EDCD1000D21
 for <ltp@lists.linux.it>; Tue, 10 Aug 2021 16:45:42 +0200 (CEST)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9FF652207B;
 Tue, 10 Aug 2021 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1628606741; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdGZPwNLvXM0NxvPkPAAxSfHtUDEQTJM13zocpteMz0=;
 b=FZNXkbsqPxCbjJ9U0jon7ruCqptLh/qZgq2MKy4AIc9WfpDh1T1aVEy5DkM3L11yS+plCS
 lawLd+lCbjPNIbOVvR6W4F9N0jubfGF2ywa1MxuIvU8TjS+CIP/EBwvPsNbo/pF2UFDrOw
 Fh9FIukghRrpq/3FAVffJjVF1i+mcgA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1628606741;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YdGZPwNLvXM0NxvPkPAAxSfHtUDEQTJM13zocpteMz0=;
 b=GpeCu6SXLFtz2g9xnnkc6p+413nGHE9Bf/v1hlZZ4br+8jykwr7RTbczkj0JizHZhi0Dz9
 gw+9igieam1W8XCw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 8BF86133D0;
 Tue, 10 Aug 2021 14:45:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id PhYbIRWREmEfOQAAGKfGzw
 (envelope-from <mdoucha@suse.cz>); Tue, 10 Aug 2021 14:45:41 +0000
To: Petr Vorel <pvorel@suse.cz>, ltp@lists.linux.it
References: <20210715065805.14086-1-pvorel@suse.cz> <YQq3s+33ceaJmvR7@pevik>
From: Martin Doucha <mdoucha@suse.cz>
Message-ID: <90123400-26a0-706d-7bb4-e4a8e962f669@suse.cz>
Date: Tue, 10 Aug 2021 16:45:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YQq3s+33ceaJmvR7@pevik>
Content-Language: en-US
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: Specify linux-stable-git rule
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 04. 08. 21 17:52, Petr Vorel wrote:
> Hi all,
> 
>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>> ---
>>  doc/c-test-api.txt | 4 ++++
>>  1 file changed, 4 insertions(+)
> 
>> diff --git a/doc/c-test-api.txt b/doc/c-test-api.txt
>> index 45784195b..9d26a483d 100644
>> --- a/doc/c-test-api.txt
>> +++ b/doc/c-test-api.txt
>> @@ -2205,6 +2205,10 @@ struct tst_test test = {
>>  };
>>  -------------------------------------------------------------------------------
> 
>> +NOTE: We don't track all backports to stable kernel but just those which are
>> +      stable branch specific (unique), i.e. no commit in mainline. Example of
>> +      commits: c4a23c852e80, cac68d12c531.
>> +
>>  Glibc git commit in a regression test for a glibc bug:
>>  [source,c]
>>  -------------------------------------------------------------------------------
> Any comment on this? I should have marked it as [RFC].

Looks good to me.

Acked-by: Martin Doucha <mdoucha@suse.cz>

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
