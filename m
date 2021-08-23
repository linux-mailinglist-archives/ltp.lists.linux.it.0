Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B44873F4465
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 06:36:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6010B3C3235
	for <lists+linux-ltp@lfdr.de>; Mon, 23 Aug 2021 06:36:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 6200A3C320E
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 06:36:05 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id D730D6002DF
 for <ltp@lists.linux.it>; Mon, 23 Aug 2021 06:36:04 +0200 (CEST)
Received: from [192.168.178.40] (unknown [188.192.255.100])
 by mail.jv-coder.de (Postfix) with ESMTPSA id C56F69F75F;
 Mon, 23 Aug 2021 04:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1629693363; bh=VES78VfEPLOa/Xy5HszRK2ESXDhbOlUFdSwhc35Bfhc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=TLJ2Gd9G/G/4JbaYz7jXmSbMOXXk8/6U4gjs0SCtn8yfA8/Er3/zTxSPJQkZonrla
 JMRq95g03xe+stKb/TfH6UJi8RwrzOv170Y6d3WrOJaTadtR1ATX/2cqsStqej9iB5
 ffzEbqrgO+I+kwMPPnyNZx2zDsIN6EUA7en7Ntf8=
To: Petr Vorel <pvorel@suse.cz>
References: <20210812043807.3497492-1-lkml@jv-coder.de>
 <YR+LAmVDEUcZ51Wt@pevik>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <3b97b712-f9d3-c5d1-66ce-0f98f5f1cb4f@jv-coder.de>
Date: Mon, 23 Aug 2021 06:36:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YR+LAmVDEUcZ51Wt@pevik>
Content-Language: en-US
X-Spam-Status: No, score=-0.9 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v2 1/2] shell: Add checkpoints api for new lib
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
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Petr,

On 8/20/2021 12:59 PM, Petr Vorel wrote:
> Hi Joerg,
>
> LGTM, good idea.
>
> But I'd rename $LTP_IPC_PATH to $TST_IPC_PATH to follow conventions to new API
> (There are also some LTP_* definitions in the legacy C API which were renamed as
> TST_* in the new API).
This would also require changing the C API, because the environment 
variable is used for communicating with it.
I we want this, I guess it could be done in another changeset.
>
>
>> +	if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "${LTP_IPC_PATH}" ]; then
> nit (remove unnecessary {}):
Could be changed while merging.
>      if [ -n "$TST_NEEDS_CHECKPOINTS" -a -f "$TST_IPC_PATH" ]; then
>> +		rm ${LTP_IPC_PATH}
> and here:
> 		rm $TST_IPC_PATH
>


Joerg

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
