Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3BD3DD52B
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 14:07:27 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1497D3C8AD3
	for <lists+linux-ltp@lfdr.de>; Mon,  2 Aug 2021 14:07:27 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 689833C4E18
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 14:07:23 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A35EC1A006A3
 for <ltp@lists.linux.it>; Mon,  2 Aug 2021 14:07:22 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 3C1E79F69E;
 Mon,  2 Aug 2021 12:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1627906041; bh=cRB8l7veuJ3LY9tFomUa96uj6pXKDWZmO2YcqWVbR/E=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=ADzVRAKxnm2kWzXTupSxJQYWYVD8GQTXVeXrGlihQS4FHD4zxRKq/080d8ZHQonHF
 u10ZXiRN/dCAOpCOaXtAKwj16QlH6DiXa3sjfcOPZhbgR5OZWsLTxdThsW/xGLN2F+
 9j/VuiGTYC8MTJoivxINA+faX0j2x/VlqS1ZBwpE=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20210730133155.31284-1-chrubis@suse.cz>
 <d99456d3-c3d3-a180-7d0c-55bc3042e63c@jv-coder.de> <YQfZLXZznHjvlGJW@yuki>
 <YQfaZsdzHbPrhCV0@yuki>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <e51c9469-73e5-69db-f5ff-c2abfd72dc95@jv-coder.de>
Date: Mon, 2 Aug 2021 14:07:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQfaZsdzHbPrhCV0@yuki>
Content-Language: en-US
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lib: tst_device: Allow more control over the
 device size
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

Hi,

On 8/2/2021 1:43 PM, Cyril Hrubis wrote:
>>> This is not enough. tst_acquire_device__ calls tst_acquire_loop_device,
>>> that again has MAX(size, DEV_SIZE_MB).
>>> But it should be sage to substitute it for size ? size : DEV_SIZE_MB as
>>> well.
>> Right, that was the old API function to get loop devices which was
>> called from old API testcases. Looks like there are no old API tests
>> that work with loop devices anymore, so this function should be removed
>> from the public API as well. I will send v2 patchset.
> Uff, that was tst_acquire_device_() not tst_acquire_loop_device() and
> tst_acquire_device_() is still in use.
>
> I'm really looking forward to a day where we can finally remove the old
> API from the library...
The usage of foo foo_ and foo__ does not really help in reading the code :)
There could also be some logic errors hiding, e.g. 
tst_acquire_loop_device should probably not default to DEV_SIZE_MB at all.
The caller should be responsible for finding a correct size and the two 
users of this function (tst_device [the binary] and 
tst_acquire_device__) do pass a concrete value for size.

Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
