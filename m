Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E92F60C4
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 13:09:17 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C43253C5447
	for <lists+linux-ltp@lfdr.de>; Thu, 14 Jan 2021 13:09:16 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id A63933C25EF
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 13:09:15 +0100 (CET)
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id AC8ED200D12
 for <ltp@lists.linux.it>; Thu, 14 Jan 2021 13:09:14 +0100 (CET)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EBxjo8145743;
 Thu, 14 Jan 2021 12:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=H71lFQZaUuPDGjuEJlpfsaa4jePFziFTHI6W9rChq+E=;
 b=U45yZdhY3BvOJIuOu3I/2MhgTxmmuNFP5BBzJtqpXarZWOS79tvRqC8YDFe/E3EEdB2V
 uL1F0XPayw5hywLNkweWDit08C93KMVXqtWEe8zusVax6BQ0hsSPmRwaCVNWo5aQVGjD
 e1Mk5Tl5FLgFD5OC9hAkQyR58HdEwQNn8XUNo34jjPx/P5XjpridF7NDg2XyQqT0eaFe
 Hehrc6JoWL493RPMbgk0prU3TMJgeRo+Sog7G+AwsVvCj4Nqe/lmi0ye5fJe3JhkvLI0
 0k9e/2q6ZAkhwRcHmF07QK8d/j3fJrhrK1orYnwAeMSzi5HWKKBWlhd7FhjONdyhJNQC Ew== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 360kg1yykt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 12:09:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10EC4pXK023273;
 Thu, 14 Jan 2021 12:09:11 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3030.oracle.com with ESMTP id 360ken4m1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 14 Jan 2021 12:09:11 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 10EC98Ie002821;
 Thu, 14 Jan 2021 12:09:10 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 14 Jan 2021 04:09:08 -0800
To: Petr Vorel <pvorel@suse.cz>
References: <20210107120247.31465-1-pvorel@suse.cz>
 <d7eba485-08db-1cc7-abe6-38d23c244bfb@oracle.com> <X/7+vk6WsJ2LDJlC@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <dced71df-28f6-056e-9518-338cccce4c11@oracle.com>
Date: Thu, 14 Jan 2021 15:09:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X/7+vk6WsJ2LDJlC@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101140072
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9863
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 suspectscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101140071
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] if-mtu-change.sh: Lower CHANGE_INTERVAL to 1
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

On 13.01.2021 17:07, Petr Vorel wrote:
> Hi Alexey,
> 
>> On 07.01.2021 15:02, Petr Vorel wrote:
>>> to make testing faster.
> 
>>> Tested only on netns based testing.
> 
> 
>> Hi Petr,
> 
>>> Signed-off-by: Petr Vorel <pvorel@suse.cz>
>>> ---
>>> Hi Alexey,
> 
>>> any reason why CHANGE_INTERVAL was set 5s?
> 
>> It's more or less safe time for default setup. Not sure why we don't
>> have tst_sleep in if_updown.sh though. I think this is for preventing
>> link-flap errors on the switch...
> Thanks for info.
> 
> BTW do you consider sleep $NS_DURATION as needed in
> testcases/network/stress/multicast/{packet-flood,query-flood}?
> It's before killing utils (ns-mcast_receiver, ns-udpsender),
> thus it could be removed during rewrite [1]


Hi Petr,

Do you mean "sleep $NS_DURATION" in mcast-pktfld02.sh is not needed
or something else?


> 
>> For netns it's can be set far less of cause by overriding CHANGE_INTERVAL.
> 
>>> It'd be nice to speedup the tests, which were slow even before
>>> 2d422edbf ("if-mtu-change.sh: Add max packet size detection for IPv4")
>>> which added 25% slowdown.
> 
>>> Could you please test this on two host based setup?
> 
>>> Kind regards,
>>> Petr
> 
>>>  testcases/network/stress/interface/if-mtu-change.sh | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
>>> diff --git a/testcases/network/stress/interface/if-mtu-change.sh b/testcases/network/stress/interface/if-mtu-change.sh
>>> index d2816606b..3efe00461 100755
>>> --- a/testcases/network/stress/interface/if-mtu-change.sh
>>> +++ b/testcases/network/stress/interface/if-mtu-change.sh
>>> @@ -11,7 +11,7 @@ TST_CLEANUP="do_cleanup"
>>>  . if-lib.sh
> 
>>>  # The interval of the mtu change [second]
>>> -CHANGE_INTERVAL=${CHANGE_INTERVAL:-5}
>>> +CHANGE_INTERVAL=${CHANGE_INTERVAL:-1}
> 
>>>  TST_TIMEOUT=$(((CHANGE_INTERVAL + 30) * MTU_CHANGE_TIMES))
> 
> 
>> It's better to remove TST_TIMEOUT so that CHANGE_INTERVAL can be set,
>> for example, to "100ms" for netns setup.
> How about keeping it, but consider CHANGE_INTERVAL as 1 if not a number
> (i.e. containing "ms", check with tst_is_int would be IMHO enough).
> I'll send a patch.
> 
> Kind regards,
> Petr
> 
> [1] https://urldefense.com/v3/__https://patchwork.ozlabs.org/project/ltp/list/?series=216562__;!!GqivPVa7Brio!J2u5nbibRS-k2rNR25GEw-G5q5x-tv_QzNwnbwDSga6KF3fsu3AeXSBKNL9IjIsvK6aV$ 
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
