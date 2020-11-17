Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D79B2B5BE1
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 10:40:21 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 04B813C4F25
	for <lists+linux-ltp@lfdr.de>; Tue, 17 Nov 2020 10:40:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id A8DD93C280C
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 10:40:19 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 0B0BA600711
 for <ltp@lists.linux.it>; Tue, 17 Nov 2020 10:40:18 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH9e8Pm141909;
 Tue, 17 Nov 2020 09:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=hC7e1eOm2KT1iGfMBMKDDbUZrwS3VnkW8iatGCeRmQM=;
 b=GGsOgrtHgOn7LYfsX6hw+fD8PmJ74cYgzKZEEuwoqIoX634iyfNYE84prK2U077K/sOl
 XLhh6jpMvYISALiXhzq0oEdF89spfhu7XBFMoM7OK9qi6L+Ney8i0D8p3mmAxwMieA5a
 9tCRZ9Zmo7pj98iKkUn5pmEv0e2UKYL4daNtvGYxi2bgPuxfPIuY8qCU15Mx3Fe78xiq
 vap4Ra786w0FFtozp3UCjkzOJDnQwgl6G2oC6tbweQ24Ni1/Tt3HlxuuYU5oaxiVvGCB
 JXVLcWESuE8avNGl9PlXhQkdIgLSXN63PCsENhz+QUdA5hpuhECZtPI1AbjI6Rgbu2jS 2g== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 34t76ksfvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 17 Nov 2020 09:40:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH9QVTn085392;
 Tue, 17 Nov 2020 09:40:11 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3030.oracle.com with ESMTP id 34ts5vuddm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 09:40:11 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 0AH9e1pJ029214;
 Tue, 17 Nov 2020 09:40:04 GMT
Received: from [192.168.1.35] (/95.161.221.177)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 17 Nov 2020 01:40:01 -0800
To: Petr Vorel <pvorel@suse.cz>, Kory Maincent <kory.maincent@bootlin.com>
References: <20201116101840.15433-1-kory.maincent@bootlin.com>
 <20201116184143.GA171432@pevik>
From: Alexey Kodanev <alexey.kodanev@oracle.com>
Message-ID: <80a391bf-b305-13ab-df79-169c8d4a0a28@oracle.com>
Date: Tue, 17 Nov 2020 12:39:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201116184143.GA171432@pevik>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170070
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1011 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170071
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH] net/host: update to new api
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
Cc: ltp@lists.linux.it, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

On 16.11.2020 21:41, Petr Vorel wrote:
> Hi Kory,
> 
> thanks for your patch.
> ...
>>  do_test()
>>  {
> 
>> -    tst_resm TINFO "test basic functionality of the \`$TC' command."
>> +    tst_res TINFO "test basic functionality of the host command."
> 
>> -    while [ $TST_COUNT -lt $NUMLOOPS ]; do
>> +    while [ $TST_COUNT -le $NUMLOOPS ]; do
> IMHO there is no need to have loop like this.
> If required, we'd just add -iN parameter to it in the runtest file (where N is
> <1,max int), but IMHO it's enough to test host only once.
> 
>>          if rhost_addr=$(host $RHOST); then
>> -            rhost_addr=$(echo "$rhost_addr" | awk -F, '{print $NF}') >/dev/null 2>&1
>> -            if ! host $rhost_addr >/dev/null 2>&1; then
>> -                end_testcase "reverse lookup with host failed"
>> -            fi
>> -
>> +            rhost_addr=$(echo "$rhost_addr" | awk '{print $NF}') >/dev/null 2>&1
>> +            EXPECT_PASS host $rhost_addr \>/dev/null 2>&1
> We need to redirect also second > and &:
> EXPECT_PASS host $rhost_addr \>/dev/null 2\>\&1
> 
>>          else
>> -            end_testcase "host $RHOST on local machine failed"
>> +            tst_brk TFAIL "host $RHOST on local machine failed"
>>          fi
> 
>> -        incr_tst_count
>> +        TST_COUNT=$((TST_COUNT + 1))
>>          sleep $SLEEPTIME
> Also sleep time is not really needed.
> 
> ...
> 
> Can I merge this simplified variant?
...
> 
> . tst_net.sh
> 
> do_test()
> {
> 	local rhost=${RHOST:-$(hostname)}

Hi Petr, Kory

For new API we shouldn't use RHOST. Also the naming is misleading,
it can be a local host name.


> 	local rhost_addr
> 
>     tst_res TINFO "test basic functionality of the host command"
> 
> 	if rhost_addr=$(host $rhost); then
> 		rhost_addr=$(echo "$rhost_addr" | awk '{print $NF}')
> 		EXPECT_PASS host $rhost_addr \>/dev/null 2\>\&1
> 	else
> 		tst_brk TFAIL "host $rhost on local machine failed"
> 	fi
> }
> 
> tst_run
> 


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
