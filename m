Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id E219F55F49
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 04:55:13 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 295CA3C1860
	for <lists+linux-ltp@lfdr.de>; Wed, 26 Jun 2019 04:55:13 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 9A6B73C02C2
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 04:55:08 +0200 (CEST)
Received: from mail-m973.mail.163.com (mail-m973.mail.163.com [123.126.97.3])
 by in-7.smtp.seeweb.it (Postfix) with ESMTP id 041B2200B15
 for <ltp@lists.linux.it>; Wed, 26 Jun 2019 04:55:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=fD2xZ
 3QkzJRU+5NKLfZxflfp2bqlgyx/fxmsTBFKc60=; b=Lgfenjd7DdFHNhdlQ6COp
 FN/UGBUka/ONFmggup+khEZfrp1ftOGTWlZMK0F38EnjIG8oZjEIhAun9Q2f/TQL
 z5eAI/I7v/dQdOWlsVLCaIa8NWPHIgky1KRJYUD7O2TS/R+csB3sIeNC5cC+/c6S
 L+1zn9qjaWKTPCK2TGL6iM=
Received: from [172.20.10.4] (unknown [122.192.12.84])
 by smtp3 (Coremail) with SMTP id G9xpCgBnA1N83hJd7Ys+AQ--.25S2;
 Wed, 26 Jun 2019 10:54:56 +0800 (CST)
To: Po-Hsu Lin <po-hsu.lin@canonical.com>, Xiao Yang <yangx.jy@cn.fujitsu.com>
References: <20190625100351.19800-1-po-hsu.lin@canonical.com>
 <5D11FEA7.1000104@cn.fujitsu.com>
 <CAMy_GT-BOitiVB6vJCno6=M5d+iz6+RxKMxsiXHH0TYbiZS7+w@mail.gmail.com>
From: Xiao Yang <ice_yangxiao@163.com>
Message-ID: <e8ca7807-4d4d-8bd5-dc8f-ed9989ba0f01@163.com>
Date: Wed, 26 Jun 2019 10:54:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAMy_GT-BOitiVB6vJCno6=M5d+iz6+RxKMxsiXHH0TYbiZS7+w@mail.gmail.com>
Content-Language: en-US
X-CM-TRANSID: G9xpCgBnA1N83hJd7Ys+AQ--.25S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw1kJr13Gr47KF17Zr18Zrb_yoW5Gw4fpF
 W7Ja1xKr18XFyUGay2kF42vF10van3tr4fWFyUXr1aqa1qqr1xtry0grs5Ga4j9w4DCFy0
 yFWUtFy3Gw1FyFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jduciUUUUU=
X-Originating-IP: [122.192.12.84]
X-CM-SenderInfo: 5lfhs5xdqj5xldr6il2tof0z/xtbB0hPeXlUMP6kwgQABs+
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] runpwtests03: use expr to calculate total_cpus
 for runpwtests03
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

Sorry, I missed the fact that tst_ncpus is executable binary.

It's good to me.

Reviewed-by: Xiao Yang <ice_yangxiao@163.com>

BTW: if you don't want to depend expr command, we can fix it by using 
total_cpus=$((total_cpus - 1)) instead.

Best Regards,
Xiao Yang

On 06/26/2019 12:13 AM, Po-Hsu Lin wrote:
> Hello!
>
> The $() here is for the tst_ncpus executable, which will return the
> total cpu number.
>
> Thanks
> PHLin
>
> On Tue, Jun 25, 2019 at 6:59 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:
>> On 2019/06/25 18:03, Po-Hsu Lin wrote:
>>> The arithmetic operation (( total_cpus-=1 )) does not work for dash,
>>> which was symbolic linked to /bin/sh on some OS like Ubuntu.
>>>
>>> In such case, people will see error like:
>>>     runpwtests03.sh: total_cpus-=1: not found
>>>
>>> And this further leads to access for a non-existing file and cause
>>> false-positive result in the end:
>>>     runpwtests03.sh: cannot create
>>>     /sys/devices/system/cpu/cpu8/cpufreq/scaling_governor: Directory nonexistent
>>>     runpwtests03.sh: FAIL: Unable to set governor -- powersave for cpu8
>>>     Power_Management03 2 TFAIL: Changing governors
>>>
>>> Use expr instead for fix this issue.
>>>
>>> Signed-off-by: Po-Hsu Lin<po-hsu.lin@canonical.com>
>>> ---
>>>    testcases/kernel/power_management/runpwtests03.sh | 9 +++------
>>>    1 file changed, 3 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/testcases/kernel/power_management/runpwtests03.sh b/testcases/kernel/power_management/runpwtests03.sh
>>> index 11197937f..3fb85d273 100755
>>> --- a/testcases/kernel/power_management/runpwtests03.sh
>>> +++ b/testcases/kernel/power_management/runpwtests03.sh
>>> @@ -25,8 +25,7 @@ export TST_TOTAL=4
>>>    . pm_include.sh
>>>
>>>    check_cpufreq_sysfs_files() {
>>> -     total_cpus=$(tst_ncpus)
>>> -     (( total_cpus-=1 ))
>>> +     total_cpus=`expr $(tst_ncpus) - 1`
>> Hi,
>>
>> It's wrong for single variable to use $(), did you mean ${tst_ncpus}?
>>
>> Best Regards,
>> Xiao Yang
>>>        RC=0
>>>
>>>        for cpu in $(seq 0 "${total_cpus}" )
>>> @@ -51,8 +50,7 @@ check_cpufreq_sysfs_files() {
>>>    change_govr() {
>>>        available_govr=$(get_supporting_govr)
>>>
>>> -     total_cpus=$(tst_ncpus)
>>> -     (( total_cpus-=1 ))
>>> +     total_cpus=`expr $(tst_ncpus) - 1`
>>>        RC=0
>>>
>>>        for cpu in $(seq 0 "${total_cpus}" )
>>> @@ -79,8 +77,7 @@ change_freq() {
>>>        available_govr=$(get_supporting_govr)
>>>        RC=0
>>>
>>> -     total_cpus=$(tst_ncpus)
>>> -     (( total_cpus-=1 ))
>>> +     total_cpus=`expr $(tst_ncpus) - 1`
>>>
>>>        if ( echo ${available_govr} | grep -i "userspace" \
>>>                >/dev/null 2>&1 ); then
>>
>>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
