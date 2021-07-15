Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 677F43C9C75
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 12:12:06 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 2DEA83C740D
	for <lists+linux-ltp@lfdr.de>; Thu, 15 Jul 2021 12:12:06 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC5D73C6158
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 12:12:04 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2E7E760067D
 for <ltp@lists.linux.it>; Thu, 15 Jul 2021 12:12:03 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id E67719F917;
 Thu, 15 Jul 2021 10:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1626343922; bh=0QclkL3x2PqKYTmn0Kt4aqNBNH1n98L5qgToa59ZJ9E=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=SoQwYylgPvDsj71V1cmMaMTPfKYBhhwBfsKPdgz0Mc9IpkYaRQ7L8FhSyceR23jaF
 QZRaIWtiDJy5mmyAAi6w8wtXP4EcNwOZmPFHES47IFwFC+tI4iSy1R9qlHji4M3Lq7
 88/j0jn/k5Z3oJ116N6VSmeDj01BzE+xrvLfm+wU=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210715050812.1950884-1-lkml@jv-coder.de>
 <60EFF034.6070800@fujitsu.com>
 <4aaba9d9-e013-3c12-500a-647ff2c0b82d@jv-coder.de> <YO//gakCvqaDZl9f@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <f2fd323e-a5da-2959-d130-2d3c0aa59e89@jv-coder.de>
Date: Thu, 15 Jul 2021 12:12:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YO//gakCvqaDZl9f@yuki>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v3] squashfs: Add regression test for sanity check
 bug
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>,
 "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Cyril,

On 7/15/2021 11:27 AM, Cyril Hrubis wrote:
> Hi!
>>>> +static struct tst_test test = {
>>>> +	.test_all = run,
>>>> +	.cleanup = cleanup,
>>>> +	.setup = setup,
>>>> +	.needs_root = 1,
>>>> +	.needs_device = 1,
>>>> +	.dev_min_size = 1,
>>>> +	.needs_cmds = (const char *const []) {
>>>> +		"mksquashfs",
>>>> +		NULL
>>>> +	},
>>>> +	.needs_drivers = (const char *const []) {
>>>> +		"squashfs",
>>>> +		NULL
>>>> +	},
>>>> +	.tags = (const struct tst_tag[]) {
>>>> +		{"linux-git", "c1b2028315c"},
>>>> +		{"linux-git", "8b44ca2b634"},
>>>> +		{}
>>>> +	},
>>>> +	.needs_tmpdir = 1,
>>> needs_device has enabled needs_tmpdir in internal, so we don't need to
>>> set it here.
>> Honestly I hate implicitness like that. I think if the test itself needs
>> the tmpdir, it should state it and not rely on some other "needs_*"
>> stuff to also enable it.
>> But if whoever merges this agrees with you, he can change it...
> We tend to avoid listing full subtree of dependencies, in this case it's
> not that bad, but it tends to get out of hand quickly.
>
> For instance mount_device flag needs implies format_device which implies
> needs_device which implies needs_tmpdir.
I agree with that. If needs_tmpdir was only required, because 
needs_device is required, I wouldn't add it.
But if needs_device implementation is changed, the test still needs a 
tmpdir. That's why I would always vote for adding it here.
> Also the dev_min_size = 1 does not have any efect here, since it can be
> used only to request bigger-than-default size and gets ignored here. I
> guess that we can merge this as it is and I will add needs_loopdev to
> the tst_test structure later which will just allocate loop device and
> pass it down to the test.
This is true, but the test should also specify what it needs. If for 
whatever reason DEV_SIZE_MB is redefined to a smaller value, the test 
would still work.
To be honest, for "1" it doesn't matter. But it it was bigger, it makes 
total sense to specify the size if the test knows it...

I don't understand why a lot of developers like implicit definitions so 
much more over explicit definitions.
I could understand it for language intrinsic stuff, because that is (or 
could be) known to all developers.
But for someone, who rarely works on a project or switches between 
different projects implicit information is bad!

Joerg


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
